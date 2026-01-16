# Page Resources for Demo Lab Content

# Opening Chapter
resource "page" "opening_welcome" {
  title = "Welcome to Instruqt 2.0"
  file  = "instructions/opening/welcome.md"
}

# Declarative Infrastructure Chapter
resource "page" "declarative_dependency_challenge" {
  title = "The Dependency Challenge"
  file  = "instructions/declarative-infrastructure/dependency-challenge.md"
}

resource "page" "declarative_config" {
  title = "Declarative Configuration"
  file  = "instructions/declarative-infrastructure/declarative-config.md"
}

resource "page" "declarative_graph" {
  title = "Understanding the Dependency Graph"
  file  = "instructions/declarative-infrastructure/dependency-graph.md"

  activities = {
    dependency-quiz = resource.quiz.dependency_graph
  }
}

# Validation Chapter
resource "page" "validation_why" {
  title = "Why Validation Matters"
  file  = "instructions/validation/why-validation.md"
}

resource "page" "validation_catching_typos" {
  title = "Catching Typos"
  file  = "instructions/validation/catching-typos.md"

  activities = {
    validation-typo = resource.task.validation_typo
  }
}

resource "page" "validation_task_mismatch" {
  title = "Task-Component Mismatch"
  file  = "instructions/validation/task-mismatch.md"

  activities = {
    validation-task-mismatch = resource.task.validation_task_mismatch
  }
}

resource "page" "validation_missing_files" {
  title = "Missing Script Files"
  file  = "instructions/validation/missing-files.md"

  activities = {
    validation-missing-file = resource.task.validation_missing_file
  }
}

resource "page" "validation_boundaries" {
  title = "Validation Boundaries"
  file  = "instructions/validation/validation-boundaries.md"
}

# Git-Native Collaboration Chapter
resource "page" "git_collab_scattered_assets" {
  title = "The Scattered Assets Problem"
  file  = "instructions/asset-management/scattered-assets.md"

  activities = {
    scattered-assets = resource.quiz.scattered_assets
  }
}

resource "page" "asset_resources" {
  title = "Asset Resources"
  file  = "instructions/asset-management/asset-resources.md"
}

resource "page" "git_collab_challenges" {
  title = "Collaboration Challenges"
  file  = "instructions/git-native-collaboration/collaboration-challenges.md"

  activities = {
    collaboration-challenges = resource.quiz.collaboration_challenges
  }
}

resource "page" "git_collab_ui_workflow" {
  title = "Creator UI Workflow"
  file  = "instructions/git-native-collaboration/creator-ui-workflow.md"
}

resource "page" "git_collab_terminal" {
  title = "Terminal Workflow"
  file  = "instructions/git-native-collaboration/terminal-workflow.md"

  activities = {
    git-conflict-resolution = resource.task.git_conflict_resolution
  }
}

resource "page" "git_collab_continuous" {
  title = "Continuous Experience"
  file  = "instructions/closing/continuous-experience.md"
}

# Modules & Reusability Chapter
resource "page" "modules_duplication_problem" {
  title = "The Duplication Problem"
  file  = "instructions/modules-reusability/duplication-problem.md"

  activities = {
    module-security = resource.quiz.module_security
  }
}

resource "page" "modules_structure" {
  title = "Module Structure: Variables and Outputs"
  file  = "instructions/modules-reusability/module-structure.md"
}

resource "page" "modules_organizational_patterns" {
  title = "Organizational Patterns"
  file  = "instructions/modules-reusability/organizational-patterns.md"
}

resource "page" "modules_scale_security" {
  title = "Scale and Security"
  file  = "instructions/modules-reusability/scale-security.md"
}

# Closing Chapter
resource "page" "closing" {
  title = "Looking Back"
  file  = "instructions/closing/reflection.md"
}
