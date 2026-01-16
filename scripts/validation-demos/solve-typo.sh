#!/bin/bash
# Solve script for typo validation task
# Recovers from any state and completes the task

cd /root/demo-lab/typo-demo || exit 1

# Fix the typo (change prometeus to prometheus)
sed -i 's/resource\.container\.prometeus/resource.container.prometheus/g' datasources.hcl

# Run validation to show it passes
instruqt lab validate

exit 0
