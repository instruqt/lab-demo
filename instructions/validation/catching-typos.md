# Catching Typos

Typos in configuration are the most common validation error. Let's see how validation catches them before they cause runtime failures.

Navigate to the typo demo:

```bash
cd /root/demo-lab/typo-demo
```

This lab has an intentional typo in the Grafana datasources configuration.

Run validation to see what errors exist:

```bash
instruqt lab validate
```

The validator will show an error about an undefined resource. The typo will be obvious.

Fix the typo in the datasources configuration:

Open `datasources.hcl` in the code editor tab.

Change line 7 from `prometeus` to `prometheus`, then save the file.

Verify the fix by running validation again:

```bash
instruqt lab validate
```

Success! Validation passes.

<instruqt-task id="validation-typo"></instruqt-task>

## Why This Matters

In tracks, this error appears at runtime. You'd:
1. Publish the lab
2. Wait for containers to start
3. See Grafana fail to connect
4. Investigate logs
5. Find the typo
6. Republish

**Total time: 15-30 minutes**

With validation: **5 seconds** to find and fix.

The difference scales. Ten typos in tracks = hours of debugging. Ten typos with validation = under a minute to fix all of them.

## Need Help?

**Stuck?** Use the **Solve** button in the task panel to automatically fix the typo and continue.

**Want to learn more?** See the [reference documentation](https://docs.labs.instruqt.com/reference/) for more details.
