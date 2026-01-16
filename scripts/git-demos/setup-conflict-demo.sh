#!/bin/bash
# Setup: Create Alex's UI commit for conflict demonstration

cd /root/lab || exit 1

# Only create commit if it doesn't exist (idempotent)
if ! git log --oneline -5 | grep -q "Alex"; then
    # Make Alex's change (simulating what happened in the UI)
    sed -i 's/Instruqt 2.0 addresses/Alex addresses/' instructions/opening/welcome.md

    # Commit with UI-style authorship
    git add instructions/opening/welcome.md
    git commit --author="Alex <alex@company.com>" -m "Update welcome page with clearer language

Improved the introduction text for better clarity." >/dev/null 2>&1
fi

exit 0
