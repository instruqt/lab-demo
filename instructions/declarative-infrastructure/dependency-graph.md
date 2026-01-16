# Understanding the Dependency Graph

## The Complete Picture

Your monitoring stack forms a directed acyclic graph (DAG). Here's the actual dependency structure:

![Dependency Graph](/assets/DAG.png)

## How It Works

### Topological Sort

Platform analyzes all references and computes a valid execution order. Resources with no dependencies start first.

### Health Checks Gate Dependents

When resources have health checks, dependent resources wait until health checks pass—not just until the process starts.

### Parallel Execution

Resources without dependencies between them start in parallel. In this graph, `demo_app` and `loki_config` start simultaneously.

### Failure Propagation

If a resource fails (startup error or health check timeout), dependent resources never start. Clean failure handling without timeouts.

## Plain Language

### Implicit Dependency

Reference something → it becomes a prerequisite.

The platform determines execution order automatically by analyzing references. You write declarative configuration describing what depends on what. The platform handles when and how.

No polling loops. No race conditions. No manual ordering.

## From 6,099 Lines to 200 Lines

Compare the traditional approach to declarative configuration:

**Traditional Bash Scripts:**
- 6,099 lines of polling loops and sleep statements
- Manual ordering with hardcoded delays
- Race conditions when assumptions break
- Difficult to maintain and debug

**Declarative Configuration:**
- ~200 lines of HCL describing resources and their relationships
- Automatic execution order via topological sort
- Built-in health checks without bash loops
- **70% maintenance reduction**

The monitoring stack you're experiencing right now? Built with this dependency graph. Zero bash polling scripts.

<instruqt-quiz id="dependency-quiz"></instruqt-quiz>
