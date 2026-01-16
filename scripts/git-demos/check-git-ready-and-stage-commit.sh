#!/bin/bash
# Check if user has verified git setup and stage Alex's commit for next pages

# Check if user has navigated to /root/lab and run git log
if grep -q "cd.*lab" /root/.bash_history && grep -q "git log" /root/.bash_history; then
    # Success! Now stage Alex's commit for the next pages
    cd /root/lab

    # Only create commit if it doesn't exist (idempotent)
    if ! git log --oneline -5 | grep -q "Alex"; then
        # Make Alex's change (simulating what happened in the UI)
        sed -i 's/Instruqt 2.0 addresses/Alex addresses/' instructions/opening/welcome.md

        # Commit with UI-style authorship
        git add instructions/opening/welcome.md
        git commit --author="Alex <alex@company.com>" -m "Update welcome page with clearer language

Improved the introduction text for better clarity.

Co-authored-by: Creator UI <ui@instruqt.com>" >/dev/null 2>&1
    fi

    exit 0
fi

exit 1
