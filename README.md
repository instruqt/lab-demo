# Instruqt 2.0 Demo Lab

A hands-on demonstration of Instruqt 2.0's lab creation capabilities, created for the Instruqt 2.0 webinar.

## Overview

This lab walks through the key features that differentiate Instruqt 2.0 from the legacy platform:

- **Declarative Infrastructure** - Implicit dependency management without manual `depends_on` or bash polling
- **Static Validation** - Catch configuration errors before deployment (typos, missing files, task mismatches)
- **Git-Native Collaboration** - Full version control workflow with UI and terminal options
- **Modules & Reusability** - Share components across labs and organizations
- **Asset Management** - Centralized asset handling with code-as-assets capability

## Chapters

| Chapter | Topics |
|---------|--------|
| Welcome | Introduction and lab overview |
| Declarative Infrastructure | Dependency graphs, implicit ordering, health checks |
| Validation | Typo detection, task-component validation, missing file checks |
| Git-Native Collaboration | Terminal workflow, Creator UI, conflict resolution |
| Modules & Reusability | Module structure, organizational patterns, security at scale |
| Asset Management | Scattered assets problem, asset resources |
| Closing | Continuous experience, reflection |

## Structure

```
.
├── main.hcl              # Lab definition and chapter structure
├── content.hcl           # Page resources
├── tasks.hcl             # Interactive task definitions
├── quizzes.hcl           # Quiz activities
├── layouts.hcl           # Panel layouts (presentation, code, terminal)
├── instructions/         # Markdown content for each page
├── assets/               # Images and static assets
├── files/                # Files mounted into containers
├── scripts/              # Lifecycle and check scripts
└── docker/               # Custom container definitions
```

## Requirements

- Instruqt CLI with 2.0 support
- Access to `gcr.io/instruqt/lab-demo-workstation:latest` image
