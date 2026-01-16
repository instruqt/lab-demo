# Task Resources for Demo Lab

# Validation Chapter: Catching Typos
resource "task" "validation_typo" {
  description = "Identify and fix the typo error caught by static validation"

  config {
    target = resource.container.workstation
  }

  condition "error_identified" {
    description = "Validation output reviewed and error understood"

    setup {
      script = "scripts/validation-demos/setup-typo.sh"
    }

    check {
      script = "scripts/validation-demos/check-typo-error-identified.sh"
      failure_message = "Have you run 'instruqt lab validate'?"
    }
  }

  condition "typo_corrected" {
    description = "Resource reference spelling corrected"

    check {
      script = "scripts/validation-demos/check-typo-fixed.sh"
      failure_message = "Check spelling in example-typo.hcl. Does 'prometeus' look correct?"
    }

    solve {
      script = "scripts/validation-demos/solve-typo.sh"
    }
  }
}

# Validation Chapter: Task-Component Mismatch
resource "task" "validation_task_mismatch" {
  description = "Map the task component to its task resource in the activities block"

  config {
    target = resource.container.workstation
  }

  condition "error_identified" {
    description = "Validation output reviewed and mismatch error understood"

    setup {
      script = "scripts/validation-demos/setup-task-mismatch.sh"
    }

    check {
      script = "scripts/validation-demos/check-task-mismatch-error-identified.sh"
      failure_message = "Have you run 'instruqt lab validate' to see the mismatch error?"
    }
  }

  condition "mismatch_resolved" {
    description = "Task component mapped in page activities block"

    check {
      script = "scripts/validation-demos/check-task-mismatch-fixed.sh"
      failure_message = "Add the activities mapping in content.hcl to connect the task component to its task resource"
    }

    solve {
      script = "scripts/validation-demos/solve-task-mismatch.sh"
    }
  }
}

# Validation Chapter: Missing Script File
resource "task" "validation_missing_file" {
  description = "Create the missing script file referenced in the task check"

  config {
    target = resource.container.workstation
  }

  condition "error_identified" {
    description = "Validation output reviewed and missing file error understood"

    setup {
      script = "scripts/validation-demos/setup-missing-file.sh"
    }

    check {
      script = "scripts/validation-demos/check-missing-file-error-identified.sh"
      failure_message = "Have you run 'instruqt lab validate' to see the missing file error?"
    }
  }

  condition "script_created" {
    description = "Missing script file created"

    check {
      script = "scripts/validation-demos/check-missing-file-fixed.sh"
      failure_message = "Create the missing script file referenced in the task check"
    }

    solve {
      script = "scripts/validation-demos/solve-missing-file.sh"
    }
  }
}

# Git-Native Collaboration: Verify Git Setup
resource "task" "verify_git_setup" {
  description = "Verify git is configured and ready for collaboration demo"

  config {
    target = resource.container.workstation
  }

  condition "git_ready" {
    description = "Git configuration verified"

    check {
      script = "scripts/git-demos/check-git-ready-and-stage-commit.sh"
      failure_message = "Run 'cd /root/lab && git log -1' to verify git is working"
    }
  }
}

# Git-Native Collaboration: Conflict Resolution
resource "task" "git_conflict_resolution" {
  description = "Successfully resolve a git merge conflict"

  config {
    target = resource.container.workstation
  }

  condition "conflict_resolved" {
    description = "Git conflict resolved and pushed"

    check {
      script = "scripts/git-demos/check-conflict-resolved.sh"
      failure_message = "Resolve the conflict in instructions/intro.md and push to origin"
    }

    solve {
      script = "scripts/git-demos/solve-conflict.sh"
    }
  }
}
