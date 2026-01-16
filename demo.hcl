# Observability Stack - Demonstrates Implicit Dependencies & Template-Based Configuration

# Demo application - generates metrics for Prometheus to scrape
resource "container" "demo_app" {
  image {
    name = "stefanprodan/podinfo:latest"
  }

  port {
    local = 9898  # Container port
    host  = 8080  # Exposed to host
  }

  network {
    id = resource.network.main.meta.id
  }

  environment = {
    PODINFO_UI_COLOR = "#34577c"
  }
}

# Template renders Prometheus config with dynamic target
resource "template" "prometheus_config" {
  source = "files/prometheus.yml"
  destination = "${data("configs")}/prometheus.yml"

  variables = {
    # This reference creates an implicit dependency on demo_app
    # Instruqt ensures demo_app starts before rendering this template
    demo_app_url = "${resource.container.demo_app.container_name}:9898"
  }
}

# Prometheus - scrapes metrics from demo app
resource "container" "prometheus" {
  image {
    name = "prom/prometheus:v2.45.0"
  }

  port {
    local = 9090
    host  = 9090
  }

  network {
    id = resource.network.main.meta.id
  }

  # Mounting the template creates another implicit dependency
  # Prometheus waits for: demo_app → template → prometheus
  volume {
    source = resource.template.prometheus_config.destination
    destination = "/etc/prometheus/prometheus.yml"
  }
}

# Static Loki configuration (no template variables needed)
resource "template" "loki_config" {
  source = "files/loki.yml"
  destination = "${data("configs")}/loki.yml"
}

# Loki - collects and stores logs
resource "container" "loki" {
  image {
    name = "grafana/loki:2.9.0"
  }

  port {
    local = 3100
    host  = 3100
  }

  network {
    id = resource.network.main.meta.id
  }

  volume {
    source = resource.template.loki_config.destination
    destination = "/etc/loki/local-config.yaml"
  }
}

# Grafana datasources - references both Prometheus and Loki
resource "template" "grafana_datasources" {
  source = "files/grafana-datasources.yml"
  destination = "${data("configs")}/grafana-datasources.yml"

  variables = {
    # Multiple dependencies - Grafana waits for both data sources
    prometheus_url = "http://${resource.container.prometheus.container_name}:9090"
    loki_url = "http://${resource.container.loki.container_name}:3100"
  }
}

# Grafana - visualizes metrics and logs from Prometheus and Loki
resource "container" "grafana" {
  image {
    name = "grafana/grafana:10.0.0"
  }

  port {
    local = 3000
    host  = 3000
  }

  network {
    id = resource.network.main.meta.id
  }

  # Dependency chain: demo_app → prometheus/loki → template → grafana
  volume {
    source = resource.template.grafana_datasources.destination
    destination = "/etc/grafana/provisioning/datasources/datasources.yml"
  }

  environment = {
    GF_AUTH_ANONYMOUS_ENABLED = "true"  # Allow anonymous access for demo
    GF_AUTH_ANONYMOUS_ORG_ROLE = "Admin"
  }
}
