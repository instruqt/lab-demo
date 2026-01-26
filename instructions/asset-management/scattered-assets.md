# The Asset Management Problem

## The Fundamental Limitation

In the old Tracks system, **assets could not live in your track code**. They had to come from somewhere else.

### What Labs Need

Lab creators work with multiple types of assets:

**Images and Diagrams:**
- Architecture diagrams for instructions
- Screenshots for walkthroughs
- Company logos and branding
- UI mockups and examples

**Configuration Files:**
- Prometheus/Grafana configs for monitoring labs
- Kubernetes manifests
- Database seed data and schemas
- Application config files (.env, application.yml)

**Remote Code Repositories:**
- Demo application source code
- Example projects for learners
- Shared libraries

### The Old Way: External Sources Only

Because assets couldn't be included in track code, you were forced to:

**For images:**
- Upload through platform UI (separate from code, not versioned with content)
- Pull from S3/GCS buckets (permissions, access control, separate deployments)
- Base64 encode in markdown (unmaintainable, breaks diffs)

**For config files:**
- `cat <<EOF` heredocs in bash scripts (terrible diffs, no syntax highlighting)
- Pull from separate GitHub repos (which repo? versioning nightmare)
- Store in cloud buckets (permission management across teams)

**For remote code:**
- Write custom bash scripts with error handling
- Hope the external source stays available
- No guarantee of version consistency

### Why This Was Painful

Every asset living **outside** your track meant:

- **No single source of truth**: Code in one place, assets scattered everywhere
- **No atomic deployments**: Deploy track code, then separately deploy assets
- **Debugging across systems**: "Which S3 bucket has the current version?"
- **Access control nightmare**: Different permissions for code vs assets
- **No audit trail**: Who changed what asset? When? Why?

## The New Way: Assets as Code

Instruqt 2.0 changes the fundamental model: **assets live alongside your lab code in git**.

You'll see how this works in the next page.

<instruqt-quiz id="scattered-assets"></instruqt-quiz>
