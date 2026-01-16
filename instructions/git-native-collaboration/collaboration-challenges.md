# Collaboration Challenges

## Distributed Lab Creation

![Code First Workflow](/assets/code_first.png)

Modern lab development involves:

- Multiple creators across teams
- Terminal users (engineers) + UI users (content writers)
- Different timezones
- Different skill sets

## Traditional Problems

Without version control, collaboration breaks down:

- **Changes overwrite each other**: No merge capability
- **No git history**: Proprietary storage systems
- **No conflict resolution**: Last save wins
- **No audit log**: Can't prove who made changes for compliance
- **Lost work**: Accidentally overwritten changes
- **Work blocks others**: Can't work simultaneously

## Real Scenario: The Lost Fix

You (Erik) find and fix a critical bug in the lab configuration. You save your changes.

Meanwhile, Alex has the UI open with the old version. They make a small instruction update and save.

Your fix is gone. Alex's save overwrote it. Alex had no way to know you made changes—there's no notification, no warning, no merge.

You discover the bug is back. But you don't know what happened. No log of who changed what. No way to see that Alex overwrote it. No way to know why your fix disappeared. You investigate, confused. Eventually you realize what must have happened. You redo the fix.

**Result**: Work lost, time wasted, frustration for both of you. Nobody was at fault. The system made collaboration impossible.

## Business Impact

Teams can't scale because:

- **Team friction**: Constant overwriting causes conflict
- **Lost productivity**: Rework and investigation time
- **Linear scaling only**: Can't parallelize work

## Try It Yourself

Before we see how the UI and terminal work together, let's verify your git setup:

```bash
cd /root/lab
git log -1
```

You should see the current lab commit. Complete the task above to continue.

<instruqt-task id="verify-git-setup"></instruqt-task>
