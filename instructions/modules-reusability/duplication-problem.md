# The Duplication Problem

## You've Built Something Great

You've built a production-grade monitoring stack: Prometheus for metrics, Loki for logs, Grafana for visualization. It works perfectly in this lab.

Now imagine you need this same stack in 50 other labs. What do you do?

## The Traditional Approach

**Copy-paste the configuration to each lab**:
- Copy the entire `demo.hcl` to 50 different labs
- Maintain 50 separate copies of the same infrastructure code
- When you need to update something, change it in 50 places
- Watch as the copies drift apart over time

## The Copy-Paste Culture

The reality is worse than intentional duplication. Many labs are created by:

1. Finding a similar existing lab
2. Copying the entire configuration
3. Modifying parts for the new use case
4. Publishing without documenting what was copied from where

**Result**: Configuration fragments are reused across dozens of labs, but nobody knows which labs share which components. Even when you want to fix a bug, you don't know where else that buggy code exists.

## Real Example: The Security Patch

A real enterprise lab team faced this exact scenario:

- **120 labs** using a standard Kubernetes configuration
- **Security vulnerability** discovered in the K8s version
- **Required action**: Update all 120 labs to patched version
- **Copied and pasted**: The configuration was reused across labs without a module
- **No documentation**: Nobody tracked which labs were using that configuration

**The result**:
- **1 week** to identify all 120 labs with the vulnerable configuration
- **3 weeks** of manual work updating configurations
- **12 labs** were missed in the initial sweep
- **Vulnerability remained exposed** in those 12 labs
- Additional week to find and patch the missed labs

**Why it was so hard**:
Finding which labs used that K8s configuration required searching through 1000+ labs. The code was copied and pasted with slight variations - sometimes with different variable names, sometimes with added features, sometimes with the indentation changed. Automated searches missed labs where the code had drifted.

**The painful part**:
Several of those 120 labs had intentionally modified the K8s configuration for specific learning scenarios. Applying the security patch broke those specialized configurations. Each required custom troubleshooting to determine why the patch didn't work and how to fix it.

## Business Impact

This duplication problem creates significant costs:

- **Slow time-to-market**: Creating new labs takes days when starting from scratch each time
- **Security risk**: Vulnerabilities persist when patches miss some copies
- **High maintenance costs**: Every update multiplies by the number of labs
- **Inconsistent experience**: Drift between copies creates learner confusion

The monitoring stack you just built? Without modules, you'd need to copy-paste and maintain it separately in every lab that needs observability.

<instruqt-quiz id="module-security"></instruqt-quiz>
