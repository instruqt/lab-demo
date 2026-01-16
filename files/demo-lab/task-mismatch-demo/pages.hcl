resource "page" "example" {
  title = "Example Page"
  file  = "instructions/example-page.md"

  # MISSING: The markdown references a task component with id "verify-setup"
  # but this page resource doesn't map it to the task resource
}
