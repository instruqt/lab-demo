resource "template" "grafana_datasources" {
  source = "files/grafana-datasources.yml"
  destination = "${data("configs")}/grafana-datasources.yml"

  variables = {
    # TYPO: "prometeus" instead of "prometheus"
    prometheus_url = "http://${resource.container.prometeus.container_name}:9090"
    loki_url = "http://${resource.container.loki.container_name}:3100"
  }
}
