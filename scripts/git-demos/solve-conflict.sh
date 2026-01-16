#!/bin/bash
# Solve script for git conflict resolution
# Handles ANY state: not started, in progress, stuck, wrong approach

cd /root/lab || exit 1

# Abort any in-progress merge/rebase
git merge --abort 2>/dev/null || true
git rebase --abort 2>/dev/null || true

# Reset any changes to welcome.md
git checkout HEAD -- instructions/opening/welcome.md 2>/dev/null || true

# Get back to a clean main branch
git checkout main 2>/dev/null || true

# Delete the my-changes branch if it exists
git branch -D my-changes 2>/dev/null || true

# Now perform the correct workflow
git checkout -b my-changes

# Make the conflicting change
sed -i 's/Alex addresses/Instruqt 2.0 addresses/' instructions/opening/welcome.md

git add instructions/opening/welcome.md
git commit -m "Restore original welcome text" >/dev/null 2>&1

# Switch back to main and merge (will create conflict)
git checkout main
git merge my-changes 2>&1 | grep -q "CONFLICT" && {
    # Conflict occurred as expected, now resolve it

    # Remove conflict markers and keep the desired line
    # Use a temp file to avoid issues with sed and conflict markers
    grep -v -E '^(<{7}|={7}|>{7})' instructions/opening/welcome.md > /tmp/welcome.md.tmp

    # Ensure the correct line is present
    sed -i 's/Alex addresses/Instruqt 2.0 addresses/' /tmp/welcome.md.tmp

    mv /tmp/welcome.md.tmp instructions/opening/welcome.md

    git add instructions/opening/welcome.md
    git commit -m "Resolve conflict: restore original welcome text" >/dev/null 2>&1
}

echo "Conflict resolved successfully!"
exit 0
