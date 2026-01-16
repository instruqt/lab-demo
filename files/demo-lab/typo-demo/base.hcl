# Base resources for validation demos
# These provide the container definitions referenced in the examples

resource "network" "main" {
  subnet = "10.0.100.0/24"
}

resource "container" "prometheus" {
  image {
    name = "prom/prometheus:v2.45.0"
  }

  network {
    id = resource.network.main.meta.id
  }
}

resource "container" "loki" {
  image {
    name = "grafana/loki:2.9.0"
  }

  network {
    id = resource.network.main.meta.id
  }
}
