# Creator UI Workflow

## How the Creator UI Works

Let's walk through how your colleague Alex uses the Creator UI to make changes. Unlike proprietary CMS systems, the Instruqt Creator UI creates real git commits.

### Step 1: Alex Opens the File

Alex wants to improve the welcome page introduction. They open the file in the Creator UI editor:

![Creator UI](/assets/ui_dashboard.png)

The UI provides a familiar editing interface with syntax highlighting and preview capabilities.
When you enter **edit mode** by clicking the button at the top of the screen, the lab fields become editable.

### Step 2: Making the Change

Alex changes line 25 in `instructions/opening/welcome.md`:

**Before:**
```
You'll see how Instruqt 2.0 addresses each of these problems.
```

**After:**
```
You'll see how Alex addresses each of these problems.
```

![Instructions Editor](/assets/ui_instructions.png)

It's a simple change to test collaboration workflows.

### Step 3: Saving Creates a Git Commit

When Alex saves, the UI doesn't just update a database. It creates a **real git commit**:

![Commit Dialog](/assets/ui_commit_dialog.png)

Notice the commit includes:
- **Proper authorship**: Alex is the commit author
- **Standard format**: Regular git commit that any tool can read
- **Commit message**: Describes what changed and why

![Git Commit History](/assets/ui_commit_history.png)

### What Makes This Different

Traditional lab platforms use proprietary storage:
- Changes go to a database, not version control
- No git history, no authorship tracking
- Can't use standard tools like `git log` or `git blame`
- No merge capability when conflicts occur

With Instruqt 2.0:
- **Same git repository**: Terminal and UI both use git
- **Real git commits**: Not a proprietary abstraction layer
- **Full interoperability**: Any git tool works (log, diff, blame, etc.)
- **Standard workflows**: Merge, branch, resolve conflicts normally

## Key Takeaway

The Creator UI is a git client. When team members use the UI, they're making git commits to the same repository you work with in the terminal.

Next, you'll see what happens when you make changes in the terminal while Alex is using the UI...
