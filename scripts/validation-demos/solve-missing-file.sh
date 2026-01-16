#!/bin/bash
# Solve script for missing file validation task

cd /root/demo-lab/missing-file-demo || exit 1

# Create the missing script file
mkdir -p scripts/checks
cat > scripts/checks/verify.sh << 'EOF'
#!/bin/bash
# Verification script
exit 0
EOF

chmod +x scripts/checks/verify.sh

# Run validation to show it passes
instruqt lab validate

exit 0
