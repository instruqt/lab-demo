# Missing Files

Validation catches missing files referenced in your configuration—scripts, templates, instructions, or any other file. Let's explore this with a script file example.

Navigate to the missing file demo:

```bash
cd /root/demo-lab/missing-file-demo
```

This lab references a script file that doesn't exist.

## Run Validation

```bash
instruqt lab validate
```

The validator will show an error about a missing script file. The task check references a script, but the file isn't in the lab directory.

## Fix It

Open the code editor tab and create the missing script file:

1. Create a new directory `scripts` if it doesn't exist
2. Create the file `scripts/verify-config.sh` with basic check logic
3. Make it executable

Or use the terminal:

```bash
mkdir -p scripts
cat > scripts/verify-config.sh <<'EOF'
#!/bin/bash
# Add your check logic here
exit 0
EOF
chmod +x scripts/verify-config.sh
```

## Verify

Run validation again:

```bash
instruqt lab validate
```

Success! The missing file error is resolved.

<instruqt-task id="validation-missing-file"></instruqt-task>

## Need Help?

**Stuck?** Use the **Solve** button in the task panel to automatically create the missing file and continue.
