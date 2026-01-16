resource "task" "verify_config" {
  description = "Verify configuration is correct"

  condition "config_verified" {
    description = "Check configuration"

    check {
      script = "scripts/verify-config.sh"  # This file doesn't exist!
    }
  }
}
