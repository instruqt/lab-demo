#!/bin/bash
# Check that Prometheus is healthy and accessible

curl -f http://localhost:9090/-/healthy > /dev/null 2>&1
