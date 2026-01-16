# Organizational Patterns

## Real-World Module Libraries

Enterprise lab teams organize modules into shared repositories that serve as organizational libraries. Here's what a typical module library looks like:

![Growing Library](/assets/growing_library.png)

## Common Modules

**Infrastructure Components**:
- `k8s_cluster` - Standard Kubernetes configuration (used in **120 labs**)
- `ide` - VS Code or Cloud IDE configuration (used in **150 labs**)
- `database` - PostgreSQL, MySQL, or Redis configurations (used in **200 labs**)
- `api_gateway` - API gateway for microservices demos (used in **85 labs**)

**Content and Learning Components**:
- `product_intro` - Standard product introduction content (used in **180 labs**)
- `instruqt_basics` - Instruqt platform onboarding (used in **220 labs**)
- `quiz_questions` - Common quiz question sets (used in **160 labs**)
- `tasks` - Standard validation task patterns (used in **140 labs**)
- `layouts` - Pre-configured layouts for common scenarios (used in **195 labs**)

**Observability Stacks**:
- `monitoring` - Prometheus, Loki, Grafana (used in **200 labs**)
- `logging` - Centralized logging configuration (used in **180 labs**)
- `tracing` - Distributed tracing with Jaeger or Tempo (used in **90 labs**)

## Module Versioning

Modules support versioning, allowing labs to pin to stable versions or upgrade when ready:

```hcl
# Pin to a specific version for stability
module "monitoring" {
  source = "github.com/company/modules/observability-stack@v2.1.0"

  variables = {}
}

# Use the latest in a major version
module "k8s" {
  source = "github.com/company/modules/k8s-cluster@v3"

  variables = {}
}

# Development: use the main branch
module "new_feature" {
  source = "github.com/company/modules/experimental-feature"

  variables = {}
}
```

## Module Versioning Format

Module sources use [go-getter format](https://github.com/hashicorp/go-getter) for versioning:

- Specific version: `source = "github.com/company/modules/stack?ref=v2.1.0"`
- Branch or tag: `source = "github.com/company/modules/stack?ref=main"`
- Subdirectories: `source = "github.com/company/modules//subdirectory"`

The `@version` shorthand shown in examples above is a simplified notation for illustration purposes.

## Shared Module Repositories

Organizations typically maintain shared module repositories in GitHub or GitLab. Teams access modules by referencing the repository URL and version in their lab configurations. The module library becomes a central resource that teams contribute to and benefit from.

## Benefits at Scale

When you build a library of reusable modules:

- **Shared maintenance**: Infrastructure team maintains common components once
- **Consistent experience**: Learners see familiar patterns across different labs
- **Rapid lab creation**: Start with proven modules instead of building from scratch
- **Organizational knowledge**: Module library becomes documentation of best practices
- **Cross-team collaboration**: Teams contribute improvements that benefit everyone

The monitoring stack you built in this lab? In a real organization, it would be one module in this library, maintained by the platform team, used by 200+ labs across all product teams.
