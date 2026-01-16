# Terminal Workflow

## Your Turn: Terminal Workflow

Now you'll make changes using the terminal, and we'll see what happens when you edit the same line Alex just changed.

### 1. Check Current State

Navigate to the lab repository and check what's been happening:

```bash
cd /root/lab
git log --oneline -5
```

You'll see Alex's recent commit from the UI.

View what Alex changed:

```bash
git show HEAD
```

Alex modified line 25 in the welcome page, changing "Instruqt 2.0 addresses" to "Alex addresses".

### 2. Create Your Branch

Let's create a branch for your changes:

```bash
git checkout -b my-changes
```

### 3. Make Your Conflicting Change

Now you'll edit the same line Alex just changed. Open the welcome page in the editor tab:

```bash
# Open in editor: instructions/opening/welcome.md
# Find line 25 and change it back
```

**Current (Alex's change):**
```
You'll see how Alex addresses each of these problems.
```

**Change to:**
```
You'll see how Instruqt 2.0 addresses each of these problems.
```

You're restoring the original text because you prefer it.

### 4. Commit Your Change

```bash
git add instructions/opening/welcome.md
git commit -m "Restore original welcome text"
```

### 5. Try to Merge

Switch back to main and try to merge your changes:

```bash
git checkout main
git merge my-changes
```

**Conflict!** Git shows:

```
Auto-merging instructions/opening/welcome.md
CONFLICT (content): Merge conflict in instructions/opening/welcome.md
Automatic merge failed; fix conflicts and then commit the result.
```

Git detected that both you and Alex changed line 25. It can't automatically decide which version to keep.

### 6. View the Conflict

```bash
cat instructions/opening/welcome.md | grep -A 5 -B 2 "Alex"
```

You'll see conflict markers around line 25:

```
<<<<<< HEAD
You'll see how Alex addresses each of these problems.
======
You'll see how Instruqt 2.0 addresses each of these problems.
>>>>>> my-changes
```

**Important:** The real git conflict markers have **7 characters** (e.g., `<<<<<<<` with 7 `<`). They're shown with 6 here to prevent git from treating this documentation as a conflict.

**Understanding the Conflict Markers:**
- `<<<<<<< HEAD` (7 `<` chars) marks the start of the conflict
- The first version (between `<<<<<<<` and `=======`) is Alex's version (current main branch)
- The second version (between `=======` and `>>>>>>>`) is your version (your branch)
- `>>>>>>> my-changes` (7 `>` chars) marks the end of the conflict

### 7. Resolve the Conflict

Open `instructions/opening/welcome.md` in the editor and resolve the conflict:

**Step-by-step:**
1. Find the conflict markers (7 `<` chars, 7 `=` chars, 7 `>` chars)
2. Delete all three marker lines
3. Keep the version you want (or combine both)
4. For this demo, keep your version: `You'll see how Instruqt 2.0 addresses each of these problems.`

**After editing, line 25 should be:**
```
You'll see how Instruqt 2.0 addresses each of these problems.
```

Save the file.

**Verify the conflict markers are gone:**
```bash
grep -E '^<<<<<<<|^=======|^>>>>>>>' instructions/opening/welcome.md
```

This command searches for 7-character markers. If it returns nothing, you've successfully removed them.

### 8. Complete the Merge

```bash
git add instructions/opening/welcome.md
git commit -m "Resolve conflict: restore original welcome text"
```

Success! The conflict is resolved.

### 9. Review the History

```bash
git log --oneline --graph -5
```

You'll see:
- Alex's commit from the UI
- Your commit from the terminal
- The merge commit resolving the conflict

## What You Experienced

- **Standard git workflow**: No special Instruqt commands needed
- **Conflict detection**: Git caught the overlapping changes
- **Full context**: You could see both versions to make informed decisions
- **Complete history**: Every change tracked with authorship

Whether changes come from the UI or terminal, git handles collaboration the same way.

## Need Help?

**Stuck on the conflict?** Use the **Solve** button in the task panel to automatically resolve the conflict and continue.

**New to git?** Learn more about [version control in Instruqt](https://docs.labs.instruqt.com/version-control/overview/)

<instruqt-task id="git-conflict-resolution"></instruqt-task>
