resource "lab" "main" {
  title       = "Instruqt 2.0 Demo - Building Labs in Labs"
  description = "Meta demo showcasing Instruqt 2.0 features through building an observability workshop inside the lab itself."

  layout = resource.layout.presentation
}

resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "workstation" {
  image {
    name = "ghcr.io/instruqt/lab-demo/workstation:latest"
  }

  network {
    id = resource.network.main.meta.id
  }
}