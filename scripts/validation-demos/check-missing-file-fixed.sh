#!/bin/bash
# Check that the missing script file has been created

if [ -f /root/demo-lab/missing-file-demo/scripts/verify-config.sh ] && [ -x /root/demo-lab/missing-file-demo/scripts/verify-config.sh ]; then
  exit 0
else
  exit 1
fi
