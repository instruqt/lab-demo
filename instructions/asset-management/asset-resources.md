# Git-Native Architecture

## Solution: Assets Local to Your Lab

Lab assets can live in your git repository when they're specific to your lab. Shared assets can be pulled from organizational asset libraries or copied from remote sources.

### Repository Structure

Your lab is a complete, self-contained directory (see [project structure](https://docs.labs.instruqt.com/getting-started/code/project-setup/#explore-the-generated-structure)):

```
my-lab/
├── main.hcl              # Lab configuration and structure
├── content.hcl           # Pages, chapters, content organization
├── tasks.hcl             # Task definitions and checks
├── quizzes.hcl           # Quiz questions and answers
├── layouts.hcl           # Custom layout definitions
├── tabs.hcl              # Tab configurations
│
├── assets/               # Images and static files (see [assets directory](https://docs.labs.instruqt.com/ui-overview/assets/))
│   ├── architecture.png  # Referenced in instructions
│   └── logo.svg          # Automatically served at /assets/
│
├── files/                # Configuration templates and static files
│   ├── prometheus.yml    # Configs for templates
│   ├── loki.yml
│   └── demo-app/         # Application code
│       └── src/
│
├── scripts/              # Setup and check scripts
│   ├── setup.sh
│   └── checks/
│       └── verify-prometheus.sh
│
├── instructions/         # Markdown instruction pages
│   ├── intro/
│   │   └── welcome.md
│   └── chapter-1/
│       └── page-01.md
│
├── docker/               # Custom Dockerfiles (if needed)
│   └── Dockerfile.workstation
│
└── notes/                # Internal development notes
    └── TODO.md
```

## Template Resources (Dynamic)

[Template resources](https://docs.labs.instruqt.com/reference/sandbox/storage/template/) render configuration files with variables, then participate in the dependency graph.

```hcl
resource "template" "prometheus_config" {
  source = "files/prometheus.yml"
  destination = "${data("configs")}/prometheus.yml"

  variables = {
    demo_app_url = "${resource.container.demo_app.container_name}:9898"
  }
}
```

**What this does**:
- Reads `files/prometheus.yml` from your repository
- Substitutes variables (like `demo_app_url`)
- Writes rendered config to destination
- Creates implicit dependencies (waits for `demo_app` container)

**When to use templates**:
- Configuration files that need dynamic values (container names, IPs, ports)
- Files that must reference other resources in your lab
- Configs that change based on lab state or variables

## Copy Resources (Static)

[Copy resources](https://docs.labs.instruqt.com/reference/sandbox/storage/copy/) move files without rendering, also participating in the DAG.

```hcl
resource "copy" "dashboard" {
  source = "files/grafana-dashboard.json"
  destination = "${data("grafana")}/dashboards/monitoring.json"
}

# Can copy from remote repositories
resource "copy" "remote" {
  source = "github.com/org/configs//monitoring"
  destination = data("configs")
}
```

**Local and remote sources**: Copy from your repository or pull from shared organizational repos.

**When to use copy**:
- Static files that don't need variable substitution
- Binary files, images, or other non-text assets
- Pulling shared configurations from organizational repositories
- Importing entire directory structures (like demo application code)

## Key Points

- **Single source of truth**: Everything in git
- **Full version history**: Every change tracked
- **Audit trail**: Who, what, when, why
- **Code review workflow**: Pull requests for asset changes
- **DAG participants**: Templates and copies create dependencies just like containers
