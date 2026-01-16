resource "task" "verify_setup" {
  description = "Verify the setup is correct"

  condition "setup_verified" {
    description = "Check that everything is configured properly"

    check {
      script = "scripts/verify.sh"
    }
  }
}
