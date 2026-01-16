# Module Structure: Variables and Outputs

## The Solution to Duplication

Instead of copying infrastructure code, you define it once in a [module](https://docs.labs.instruqt.com/reference/types/module/) and reuse it across labs. Modules solve the duplication problem through two key mechanisms: **variables** and **outputs**.

![Learning Curve](/assets/learning_curve.png)

## Variables: Customization Without Forking

Variables allow each lab to customize the module without modifying the source code.

**Module Definition** (`modules/observability-stack/main.hcl`):
```hcl
variable "prometheus_version" {
  default = "v2.45.0"
}

variable "scrape_interval" {
  default = "15s"
}

resource "container" "prometheus" {
  image = "prom/prometheus:${variable.prometheus_version}"

  # ... port mappings, networks, etc ...

  volume {
    source = resource.template.prometheus_config.destination
    destination = "/etc/prometheus/prometheus.yml"
  }
}

resource "template" "prometheus_config" {
  source = "templates/prometheus.yml.tpl"

  variables = {
    scrape_interval = variable.scrape_interval
  }
}

# ... loki, grafana, and other resources ...
```

**Key Point**: The module defines sensible defaults, but labs can override them for specific needs.

## Outputs: Composition and Integration

Outputs expose information from the module so other parts of your lab can use it.

**Module Definition** (continued):
```hcl
output "prometheus_url" {
  value = "http://localhost:${resource.container.prometheus.port.9090}"
}

output "grafana_url" {
  value = "http://localhost:${resource.container.grafana.port.3000}"
}
```

**Module Usage** (in your lab's `main.hcl`):
```hcl
module "monitoring" {
  source = "github.com/company/modules/observability-stack"  # See [module sources](https://docs.labs.instruqt.com/reference/types/module/)

  variables = {
    prometheus_version = "v2.46.0"
    scrape_interval = "10s"
  }
}

# Use the module's outputs in your lab
# Service resource exposes the Grafana UI
resource "service" "grafana_dashboard" {
  target = resource.container.grafana
  port = 3000
  scheme = "http"
}

# Then reference in a layout tab:
# tab "grafana" {
#   target = resource.service.grafana_dashboard
#   title = "Monitoring Dashboard"
# }

resource "container" "demo_app" {
  # ... app configuration ...

  environment = {
    METRICS_ENDPOINT = module.monitoring.output.prometheus_url
  }
}
```

## Key Points

- **Variables enable customization without forking**: Each lab can adjust the module to its needs while still getting updates from the source
- **Outputs enable composition**: Modules can expose information that other resources use, creating integrated lab experiences
- **Single source of truth**: Update the module once, and all labs using it can pull the changes
- **Versioning support**: Labs can pin to specific versions for stability or upgrade when ready

The monitoring stack you experienced in this lab? It could be a module used by 200 other labs, all customized through variables, all integrated through outputs.
