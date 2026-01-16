# Quiz Resources for Demo Lab

# Question: What creates implicit dependencies
resource "single_choice_question" "implicit_dependency" {
  question = "What creates an implicit dependency in Instruqt 2.0?"
  answer   = "Resource references"

  distractors = [
    "Alphabetical resource names",
    "Resource type ordering"
  ]

  hints = [
    "Think about how one resource knows it needs to wait for another",
    "Look at the template resource example - what makes it wait for demo_app?"
  ]
}

# Quiz: Understanding dependency graph
resource "quiz" "dependency_graph" {
  questions = [
    resource.single_choice_question.implicit_dependency
  ]

  show_hints   = true
  show_answers = true
  attempts     = -1
}

# Question: Git workflow benefits
resource "multiple_choice_question" "git_workflow_benefits" {
  question = "Which benefits do you get from using git for lab collaboration? (Select all that apply)"
  answer   = [
    "Version controlled changes with full history",
    "Authorship attribution for audit trails",
    "Standard industry tools like git log and git blame work",
  ]

  distractors = [
    "Automatic deployment to production environments",
    "Guaranteed zero conflicts between team members",
  ]

  hints = [
    "Think about what git provides natively, not what external tools might add",
  ]
}

# Quiz: Git collaboration
resource "quiz" "git_collaboration" {
  questions = [
    resource.multiple_choice_question.git_workflow_benefits
  ]

  show_hints   = true
  show_answers = true
  attempts     = -1
}

# Question: Asset management problem
resource "single_choice_question" "asset_management" {
  question = "What is the main problem with scattered asset storage across S3, GCS, and UI uploads?"
  answer   = "No audit trail and difficult to track which labs use which assets"

  distractors = [
    "Files are too large and slow to download",
    "Teams can't access cloud storage providers",
  ]

  hints = [
    "Think about compliance and debugging across multiple systems",
  ]
}

# Quiz: Scattered assets
resource "quiz" "scattered_assets" {
  questions = [
    resource.single_choice_question.asset_management
  ]

  show_hints   = true
  show_answers = true
  attempts     = -1
}

# Question: Module benefits for security
resource "single_choice_question" "module_benefits" {
  question = "What is the primary benefit of using modules for security patches?"
  answer   = "Update the module once and all labs get the patch automatically"

  distractors = [
    "Security patches are automatically detected and applied",
    "Modules prevent security vulnerabilities from being introduced",
  ]

  hints = [
    "Think about the 120 labs example - how did modules reduce the patching time?",
  ]
}

# Quiz: Module security
resource "quiz" "module_security" {
  questions = [
    resource.single_choice_question.module_benefits
  ]

  show_hints   = true
  show_answers = true
  attempts     = -1
}
