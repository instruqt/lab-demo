# Creator UI Workflow

## How the Creator UI Works

While you work in the terminal, your team members can edit lab content through the Creator UI.

**Note:** Screenshot placeholder - actual Creator UI editor showing file editing interface would appear here.

### What Happens Behind the Scenes

When someone saves changes in the UI:

1. **The UI creates a real git commit** (not proprietary storage)
2. **Proper authorship attribution** using git's co-author format
3. **Commit to the same repository** you're working with in the terminal

**Note:** Screenshot placeholder - git commit with UI co-author attribution would appear here.

### Alex's Changes

While you were reviewing the validation chapter, Alex (your colleague) used the Creator UI to improve the welcome page introduction. Let's see what happened.

Check the git log:

```bash
cd /root/lab
git log --oneline -5
```

You'll see Alex's commit with proper authorship attribution.

View the commit details:

```bash
git show HEAD
```

Notice:
- Commit author: Alex Chen
- Co-authored-by tag from the UI
- Standard git commit format

## Key Points

- **Same git repository**: Terminal and UI both work with git
- **Real git commits**: No proprietary storage layer
- **Proper attribution**: Co-author tags track UI vs terminal edits
- **Standard workflows**: Use any git tool (log, blame, diff, etc.)

Next, you'll make changes in the terminal and see how git handles collaboration when both you and Alex edit the same file.
