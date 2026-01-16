# Task-Component Mismatch

Validation doesn't just check HCL syntax—it validates connections between files. When markdown references a task component, it must be mapped to a task resource in your HCL configuration. Validation catches these cross-file mismatches.

Navigate to the task mismatch demo:

```bash
cd /root/demo-lab/task-mismatch-demo
```

This lab has a task component in the markdown but no activities mapping.

Validate the lab to see the error:

```bash
instruqt lab validate
```

The validator will show an error about a task component that isn't mapped. The markdown file contains a task component with id="verify-setup" but the page resource doesn't map it to a task.

Examine the files to understand the problem:

Check the markdown:

```bash
cat instructions/example-page.md
```

See the task component with id="verify-setup".

Check the page resource:

```bash
cat pages.hcl
```

Notice: no `activities` block mapping the component to a task.

Check if the task exists:

```bash
cat tasks.hcl
```

The task resource exists! It just needs to be mapped.

Fix the mapping by editing the page resource:

Open `pages.hcl` in the code editor tab and add the activities mapping:

```hcl
resource "page" "example" {
  title = "Example Page"
  file  = "instructions/example-page.md"

  activities = {
    verify-setup = resource.task.verify_setup
  }
}
```

Verify the fix by running validation again:

```bash
instruqt lab validate
```

Success! The task component is now properly mapped.

Once you've fixed the mapping in the demo lab and verified it passes validation, mark this task complete:

<instruqt-task id="validation-task-mismatch"></instruqt-task>

## Why This Matters

This demonstrates validation across your entire lab structure—HCL files (tasks.hcl, content.hcl), markdown instructions, and the connections between them.

Without validation, you'd publish the lab and learners would see the task component UI element. They'd click it, expecting something to happen. Nothing would.

Support request: "The task button doesn't work."

You'd investigate, find the missing mapping, fix it, republish.

**Runtime discovery: 30+ minutes including support ticket overhead**

**Validation: 5 seconds**

## Need Help?

**Stuck?** Use the **Solve** button in the task panel to automatically add the activities mapping and continue.

**Want to understand more?**
- [Task resource documentation](https://docs.labs.instruqt.com/reference/content/task/)
- [Page resource documentation](https://docs.labs.instruqt.com/reference/content/page/) for activities configuration
