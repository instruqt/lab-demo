# Instruqt 2.0 Demo Lab - Instructions

Complete instructional content for the 6-chapter demo (target: 20-25 minutes).

## Chapter Structure

### Opening: Welcome (1 page)

**Directory**: `opening/`

Professional introduction setting expectations and previewing business value.

- `welcome.md` - What you'll build, what you'll experience, business value preview

**Layout**: `presentation`

### Chapter 1: Declarative Infrastructure (3 pages)

**Directory**: `declarative-infrastructure/`

Demonstrates implicit dependencies and declarative configuration.

- `page-01-dependency-challenge.md` - The 6,099-line bash script problem
- `page-02-declarative-config.md` - Solution with implicit dependencies + health checks
- `page-03-dependency-graph.md` - Visual diagram, how it works, brief quiz

**Layouts**: `presentation` → `code` → `code`

**Metrics**: 70% maintenance reduction

**Quiz**: 1 quiz on dependency graph understanding

### Chapter 2: Validation (4 pages)

**Directory**: `validation/`

Shows comprehensive static validation catching errors before runtime.

- `page-01-why-validation.md` - Traditional vs new flow, cost of runtime errors
- `page-02-catching-typos.md` - Hands-on: Fix typo error (2-condition task)
- `page-03-task-mismatch.md` - Hands-on: Add activities mapping (2-condition task)
- `page-04-orphaned-and-limits.md` - Hands-on: Fix missing file + validation boundaries (2-condition task)

**Layouts**: `presentation` → `code` → `code` → `code`

**Metrics**: 40% fewer support tickets

**Tasks**: 3 interactive validation exercises with 2 conditions each

### Chapter 3: Git-Native Assets & Collaboration (6 pages)

**Directory**: `git-native-collaboration/`

Everything in version control with standard git workflows for collaboration.

- `page-01-scattered-assets.md` - The scattered assets problem at enterprise scale
- `page-02-git-native-architecture.md` - Repository structure, templates/copies
- `page-03-collaboration-challenges.md` - Distributed teams, traditional problems
- `page-04-terminal-workflow.md` - Erik's git workflow in terminal (hands-on)
- `page-05-creator-ui-workflow.md` - Alex's UI workflow, merging, conflict resolution
- `page-06-continuous-experience.md` - Brief platform capabilities mention

**Layouts**: `presentation` → `presentation` → `presentation` → `terminal` → `terminal` → `terminal`

**Value**: Compliance & governance, linear team scaling

### Chapter 4: Modules & Reusability (4 pages)

**Directory**: `modules-reusability/`

Demonstrates reusable components and content at scale.

- `page-01-duplication-problem.md` - Real example: 120 labs, 3 weeks to patch
- `page-02-module-structure.md` - Variables and outputs, usage patterns
- `page-03-organizational-patterns.md` - Common modules, versioning, org library
- `page-04-scale-security.md` - Security patching (weeks → hours), business value

**Layouts**: `presentation` → `code` → `presentation` → `presentation`

**Metrics**: 80% duplication reduction, 10x faster security patching, 5x faster lab creation

### Closing (1 page)

**Directory**: `closing/`

Reflection and business impact summary.

- `page-01-reflection.md` - What you accomplished, meta insight, business impact summary, next steps

**Layout**: `presentation`

## Total Content

- **6 chapters** (opening, 4 main chapters, closing)
- **19 pages total**
- **1 quiz** (dependency graph understanding)
- **3 interactive tasks** (validation exercises with 2 conditions each)
- **Target duration**: 20-25 minutes

## Navigation Flow

1. Opening: Welcome
2. Declarative Infrastructure: Dependencies and health checks
3. Validation: Static validation catching errors early
4. Git-Native Collaboration: Version control and team workflows
5. Modules & Reusability: Components at scale
6. Closing: Reflection and business impact

## Writing Style

Professional technical documentation with:
- Business impact framing for each feature
- Quantified outcomes (70%, 40%, 80%, 10x, 5x metrics)
- Clear value propositions
- Direct, informative tone
- Equal treatment for all features

## Key Business Metrics

Throughout the demo:
- **70% maintenance reduction** (Declarative Infrastructure)
- **40% fewer support tickets** (Validation)
- **Compliance & governance** (Git-Native Assets)
- **Linear team scaling** (Collaboration)
- **80% duplication reduction** (Modules)
- **10x faster security patching** (Modules)
- **5x faster lab creation** (Modules)

## Technical Infrastructure

The demo showcases:
- Implicit dependency management with health checks
- Multi-condition task validation
- Git-native asset management with templates/copies
- Standard git workflows (terminal + UI)
- Module patterns and organizational structures

The meta insight: This lab was built using Instruqt 2.0, demonstrating the platform's capabilities through its own creation.
