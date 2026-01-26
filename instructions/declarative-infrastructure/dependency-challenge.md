# The Dependency Challenge

Imagine you're building a monitoring stack where components depend on each other:

- Demo app must be running before Prometheus can scrape it
- Prometheus must be ready before Grafana connects
- Configuration files need actual values from running containers (container names, IPs, ports)

These dependencies are fundamental to distributed systems. Two questions: How do you manage the order? And how do you get runtime values into configuration files?

![Hidden Dependencies](/assets/hidden_dependencies.png)

## Traditional Approach: Bash Orchestration Scripts

The conventional solution requires a single bash script that handles container startup, ordering, runtime value extraction, and config generation:

```bash
# Start demo app first
docker run -d --name demo-app ...

# Wait for it to be ready
until $(curl --output /dev/null --silent --head --fail http://localhost:8080); do
    printf '.'
    sleep 5
done

# Extract runtime values from running containers
DEMO_APP_NAME=$(docker inspect demo-app | grep -o '"Name": "[^"]*"' | head -1 | cut -d'"' -f4)

# Generate Prometheus config with actual container name
cat > prometheus.yml <<EOF
scrape_configs:
  - job_name: 'demo'
    static_configs:
      - targets: ['${DEMO_APP_NAME}:8080']
EOF

# Now start Prometheus with generated config
docker run -d -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml ...

# Repeat for each dependency...
```

You can't use docker-compose or standard orchestration, because they won't handle all of these tasks for you. You're manually managing startup order, extracting runtime values, generating configs, and injecting them into containers.

This all ends up turning into:

- **6,099 lines** of bash dependency management scripts
- **Config files embedded in bash** - YAML, JSON, and other configs inside cat heredocs with no syntax highlighting
- **Debug hell** - Misplaced quotes or syntax errors in embedded configs are nearly impossible to find
- Hundreds of engineering hours spent maintaining these scripts
- Brittle behavior with race conditions in production
- Failed labs when timing assumptions break

This isn't an outlier. Manual dependency management becomes a maintenance burden at scale.

## Business Impact

**Wasted Engineering Time** - Writing, debugging, and maintaining bash polling loops instead of building features

**Slow Startup Times** - Sequential polling with fixed sleep intervals prevents parallelization

**Hard to Debug Failures** - When dependencies fail, bash scripts provide minimal diagnostic information

**No Parallelization** - Manual ordering forces sequential execution even when parallel startup is safe

Traditional bash-based dependency management works for small projects. At enterprise scale, it becomes a bottleneck.

There's a better approach.
