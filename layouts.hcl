resource "layout" "presentation" {
  column {
    instructions {
    }
  }
}

resource "layout" "code" {
  column {
    row {
      column {
        tab "code" {
          target = resource.editor.code
        }

        tab "shell" {
          target = resource.terminal.shell
        }
      }
    }
  }

  column {
    width = 50

    instructions {
    }
  }
}

resource "layout" "terminal" {
  column {
    row {
      column {
        tab "code" {
          target = resource.editor.code
        }
      }
    }

    row {
      height = 34

      column {
        tab "shell" {
          target = resource.terminal.shell
        }
      }
    }
  }

  column {
    width = 50

    instructions {
    }
  }
}

resource "layout" "debug" {
  column {
    row {
      column {
        tab "code" {
          target = resource.editor.code
        }
      }
    }

    row {
      height = 34

      column {
        tab "debug_shell" {
          target = resource.terminal.debug
        }
      }
    }
  }

  column {
    width = 50

    instructions {
    }
  }
}

resource "layout" "immersive" {
  column {
    row {
      column {
        tab "grafana" {
          target = resource.service.grafana
        }
      }
    }

    row {
      height = 34

      column {
        tab "shell" {
          target = resource.terminal.shell
        }
      }
    }
  }

  column {
    width = 50

    instructions {
    }
  }
}