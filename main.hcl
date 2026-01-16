resource "lab" "main" {
  title = "Instruqt 2.0 Demo"

  # Heredoc syntax for multi-line descriptions
  description = <<-EOT
    Demonstrate Instruqt 2.0's powerful features through hands-on examples:
    - Implicit dependency management (no manual depends_on!)
    - Template-based configuration with dynamic variables
    - Multiple layout options for different demo scenarios
    - Complete observability stack (Prometheus, Loki, Grafana)
  EOT

  layout = resource.layout.presentation  # Default layout - can be changed per page

  # Extended time limits for demo and development
  settings {
    timelimit {
      duration   = "6h"   # 6 hour maximum session
      show_timer = false  # Hide timer for less pressure during demos
    }

    idle {
      enabled = false  # No idle timeout - useful for demos with pauses
    }
  }

  content {
    title = "Instruqt 2.0 Demo"

    chapter "opening" {
      title = "Welcome"

      page "welcome" {
        reference = resource.page.opening_welcome
        layout    = resource.layout.presentation
      }
    }

    chapter "declarative-infrastructure" {
      title = "Declarative Infrastructure"

      page "dependency-challenge" {
        reference = resource.page.declarative_dependency_challenge
        layout    = resource.layout.presentation
      }

      page "declarative-config" {
        reference = resource.page.declarative_config
        layout    = resource.layout.code
      }

      page "dependency-graph" {
        reference = resource.page.declarative_graph
        layout    = resource.layout.code
      }
    }

    chapter "validation" {
      title = "Validation"

      page "why-validation" {
        reference = resource.page.validation_why
        layout    = resource.layout.presentation
      }

      page "catching-typos" {
        reference = resource.page.validation_catching_typos
        layout    = resource.layout.code
      }

      page "task-mismatch" {
        reference = resource.page.validation_task_mismatch
        layout    = resource.layout.code
      }

      page "missing-files" {
        reference = resource.page.validation_missing_files
        layout    = resource.layout.code
      }

      page "validation-boundaries" {
        reference = resource.page.validation_boundaries
        layout    = resource.layout.code
      }
    }

    chapter "git-native-collaboration" {
      title = "Git-Native Collaboration"

      page "challenges" {
        reference = resource.page.git_collab_challenges
        layout    = resource.layout.presentation
      }

      page "terminal-workflow" {
        reference = resource.page.git_collab_terminal
        layout    = resource.layout.terminal
      }

      page "ui-workflow" {
        reference = resource.page.git_collab_ui_workflow
        layout    = resource.layout.terminal
      }
    }

    chapter "modules-reusability" {
      title = "Modules & Reusability"

      page "duplication-problem" {
        reference = resource.page.modules_duplication_problem
        layout    = resource.layout.presentation
      }

      page "module-structure" {
        reference = resource.page.modules_structure
        layout    = resource.layout.presentation
      }

      page "organizational-patterns" {
        reference = resource.page.modules_organizational_patterns
        layout    = resource.layout.presentation
      }

      page "scale-security" {
        reference = resource.page.modules_scale_security
        layout    = resource.layout.presentation
      }
    }

    chapter "asset-management" {
      title = "Asset Management"

      page "scattered-assets" {
        reference = resource.page.git_collab_scattered_assets
        layout    = resource.layout.presentation
      }

      page "asset-resources" {
        reference = resource.page.asset_resources
        layout    = resource.layout.presentation
      }
    }

    chapter "closing" {
      title = "Closing"

      page "continuous" {
        reference = resource.page.git_collab_continuous
        layout    = resource.layout.presentation
      }

      page "reveal" {
        reference = resource.page.closing
        layout    = resource.layout.presentation
      }
    }
  }
}

# Network for all containers - Instruqt automatically manages DNS resolution
resource "network" "main" {
  subnet = "10.0.200.0/24"
}

# Workstation container - using custom ubuntu image with instruqt CLI and tools
resource "container" "workstation" {
  image {
    name = "gcr.io/instruqt/lab-demo-workstation:latest"
  }

  command = ["tail", "-f", "/dev/null"]

  network {
    id = resource.network.main.meta.id
  }

  resources {
    memory = 2048  # 2GB RAM
    cpu    = 1000  # 1 CPU core
  }

  volume {
    source      = "files/demo-lab"
    destination = "/root/demo-lab"
  }

  volume {
    source      = "files/bashrc"
    destination = "/root/.bashrc"
  }

  volume {
    source      = "."
    destination = "/root/lab"
  }
}