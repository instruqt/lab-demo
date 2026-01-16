#!/bin/bash
# Check that the task component is mapped in the activities block

# Check if activities block exists with verify-setup mapping
if grep -A 3 'activities.*{' /root/demo-lab/task-mismatch-demo/pages.hcl | grep -q 'verify-setup.*=.*verify_setup'; then
  exit 0
fi

exit 1
