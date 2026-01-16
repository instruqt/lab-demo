#!/bin/bash
# Check that the git conflict has been resolved (local workflow)

CONFLICT_FILE="/root/lab/instructions/opening/welcome.md"

# Check if file has conflict markers (should be absent)
if grep -qE '^<<<<<<< HEAD|^=======|^>>>>>>>' "$CONFLICT_FILE" 2>/dev/null; then
  exit 1
fi

# Check git status for unmerged paths
if git -C /root/lab status --porcelain 2>/dev/null | grep -q '^UU'; then
  exit 1
fi

# Check that merge was completed (no unmerged files)
if git -C /root/lab diff --name-only --diff-filter=U 2>/dev/null | grep -q .; then
  exit 1
fi

exit 0
