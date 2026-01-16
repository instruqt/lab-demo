resource "terminal" "shell" {
  target = resource.container.workstation
  shell  = "/bin/bash"
}

resource "terminal" "debug" {
  target = resource.container.workstation
  shell  = "/bin/bash"
}

resource "editor" "code" {
  workspace "lab_files" {
    directory = "."
  }

  workspace "demo_lab" {
    target    = resource.container.workstation
    directory = "/root/demo-lab"
  }
}

resource "service" "grafana" {
  target = resource.container.grafana
  scheme = "http"
  port   = 3000
}
