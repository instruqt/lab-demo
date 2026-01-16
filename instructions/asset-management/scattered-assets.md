# The Scattered Assets Problem

## The Asset Storage Problem

Lab creators work with multiple types of assets:

### Images and Diagrams
- Architecture diagrams for instructions
- Screenshots for walkthroughs
- Company logos and branding
- UI mockups and examples

**Current storage locations**:
- Uploaded through platform UI (but stored where? which version?)
- Personal S3 buckets (access expires, accounts change)
- Google Cloud Storage (permission issues across teams)
- Base64 encoded directly in markdown (unmaintainable)
- Attachments in support tickets (lost when tickets close)

**The problem**: If someone deletes a file from S3, which labs break? No way to know.

### Configuration Files
- Prometheus/Grafana configs for monitoring labs
- Kubernetes manifests for container orchestration
- Database seed data and schemas
- Application config files (.env, application.yml)

**Current storage locations**:
- `cat <<EOF` heredocs in bash scripts (terrible diffs, can't review changes)
- Separate GitHub repositories (which repo? access control?)
- Cloud storage buckets (GCS, S3 - permission nightmares)

**The problem**: You can't template these files with dynamic values. `cat` heredocs are your only option, and they're unreadable in git diffs.

### Remote Code Repositories
- Demo application source code
- Example projects for learners to explore
- Shared libraries and dependencies

**The problem**: How do you pull an entire git repository into a lab environment? Currently requires custom bash scripts with error handling.

## Enterprise Scale Problems

When you have 100+ labs across multiple teams:

- **No audit trail** → can't track who changed what
- **Debugging across 5 systems** → wasted time
- **No single source of truth** → configuration drift

## Business Impact

This scattered approach causes:

- Wasted time searching for assets
- No visibility into who changed what
- Security risks (unknown asset provenance)

<instruqt-quiz id="scattered-assets"></instruqt-quiz>
