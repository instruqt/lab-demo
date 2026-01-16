#!/bin/bash
# Check that the learner has run validation after cd-ing into the demo directory

# Find line number of the last cd to task-mismatch-demo
MARKER_LINE=$(grep -n "cd.*task-mismatch-demo" /root/.bash_history 2>/dev/null | tail -1 | cut -d: -f1)

if [ -z "$MARKER_LINE" ]; then
  exit 1
fi

# Check if "instruqt lab validate" appears after the cd command
if tail -n +$((MARKER_LINE + 1)) /root/.bash_history 2>/dev/null | grep -q "instruqt lab validate"; then
  exit 0
fi

exit 1
