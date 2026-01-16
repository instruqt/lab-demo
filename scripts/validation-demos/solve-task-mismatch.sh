#!/bin/bash
# Solve script for task mismatch validation task

cd /root/demo-lab/task-mismatch-demo || exit 1

# Check if mapping already exists to avoid duplication
if ! grep -q 'verify-setup = resource.task.example_task' content.hcl; then
    # Find the page resource and add activities block
    # More robust approach: use awk to insert after page resource opening
    awk '
        /resource "page" "example"/ {
            print
            getline
            print
            print "  activities = {"
            print "    verify-setup = resource.task.example_task"
            print "  }"
            print ""
            next
        }
        {print}
    ' content.hcl > content.hcl.tmp
    mv content.hcl.tmp content.hcl
fi

# Run validation to show it passes
instruqt lab validate

exit 0
