#!/bin/bash
# Check that the typo has been fixed
# The file should now reference "prometheus" not "prometeus"

if grep -q 'resource.container.prometheus\.container_name' /root/demo-lab/typo-demo/datasources.hcl; then
  exit 0
else
  exit 1
fi
