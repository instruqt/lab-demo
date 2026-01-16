# Declarative Configuration

## The Solution: Implicit Dependencies

We can solve both problems with declarative configuration: **references create dependencies** and **templates handle runtime values**. No bash polling loops, no embedded configs.

### How It Works

When one resource references another, Instruqt automatically creates a dependency:

```hcl
resource "container" "demo_app" {
  image {
    name = "stefanprodan/podinfo:latest"
  }

  port {
    local = 9898
    host = 8080
  }
}

resource "template" "prometheus_config" {
  source = "files/prometheus.yml"
  destination = "${data("configs")}/prometheus.yml"

  variables = {
    # Referencing demo_app creates an implicit dependency: template depends on demo_app
    # No manual depends_on required - the reference itself declares the dependency
    demo_app_url = "${resource.container.demo_app.container_name}:9898"
  }
}
```

The [template resource](https://docs.labs.instruqt.com/reference/sandbox/storage/template/) won't render until `demo_app` exists. We don't have to manually define the dependency with `depends_on` - we just reference the value we want to use, which automatically creates the dependency. You can still use `depends_on` if you need to create a dependency without referencing a value.

### Templates Participate in the Graph

Instead of generating configs with bash cat heredocs (no syntax highlighting, debug hell), templates are first-class resources with proper source files:

```hcl
resource "container" "prometheus" {
  image { name = "prom/prometheus:v2.45.0" }

  # Mounting the template creates another dependency
  # Chain: demo_app → template → prometheus
  volume {
    source = resource.template.prometheus_config.destination
    destination = "/etc/prometheus/prometheus.yml"
  }
}
```

Prometheus ([container resource](https://docs.labs.instruqt.com/reference/sandbox/compute/container/)) won't start until the template renders. The template won't render until `demo_app` exists.

Your source file (`files/prometheus.yml`) has proper syntax highlighting in your editor. Runtime values like `${resource.container.demo_app.container_name}` are substituted declaratively—no string manipulation in bash, no misplaced quotes to debug.

### Built-In Health Checks

Beyond just starting, resources can wait for healthy state with [health checks](https://docs.labs.instruqt.com/reference/sandbox/compute/container/):

```hcl
resource "container" "demo_app" {
  health_check {
    timeout = "30s"
    http {
      address = "http://host.docker.internal:8080/healthz"
      success_codes = [200]
    }
  }
}

resource "container" "postgres" {
  // Wait for postgres container to be ready as initialization can take a while
  health_check {
    timeout = "30s"

    exec {
      script = <<-EOF
        pg_isready -h localhost -p 5432 -U postgres
      EOF
    }
  }
}
```

Dependent resources wait for health checks to pass—not just process start, but actual readiness. Health checks can be HTTP endpoints, exec scripts, or other methods depending on what you need.

## Key Points

**Reference = Dependency** - No manual `depends_on` declarations necessary. References naturally express dependencies.

**Health Checks Built In** - Platform validates service readiness. No bash polling loops required.

**Templates Participate** - Proper source files with syntax highlighting. Runtime value substitution is declarative, not bash string manipulation.

**Declarative, Not Imperative** - Describe what you want, not how to achieve it. Platform handles execution order.

Open `demo.hcl` in the editor to see how these patterns work together. Notice how there are no explicit `depends_on` declarations—dependencies flow naturally from references.
