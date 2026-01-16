# Validation Boundaries

Validation is powerful, but not magic. Understanding its boundaries helps you build the right testing strategy.

## What Validation CAN Catch

### Syntax Errors
HCL parsing errors, malformed configuration

### Resource References
Typos in resource names, undefined resources

### Missing Mappings
Task components without activities mappings

### Missing Files
Script files, template sources, copy sources referenced but not present

### Type Mismatches
Incorrect attribute types, invalid enum values

## What Validation CANNOT Catch

### Runtime Errors
Scripts that fail during execution

### Network Issues
Services that can't connect, port conflicts

### Logic Errors
Scripts with incorrect logic that pass syntax but fail semantically

### Performance Issues
Slow-starting services, memory exhaustion

### External Dependencies
Remote resources that don't exist or are misconfigured

## The Right Strategy

Validation catches **static configuration errors**. Complement it with:

- **Testing in the platform** - Run your lab to catch runtime issues
- **Health checks** - Verify services reach healthy state
- **Integration tests** - Test actual learner workflows
- **Monitoring** - Track lab performance in production

Validation isn't a replacement for testing—it's the first line of defense that catches errors before you even start testing.

## Business Impact

Static validation catches 60-70% of configuration errors instantly. The remaining 30-40% require runtime testing. But catching the majority during development dramatically reduces:

- Support burden (40% reduction)
- Development cycle time (instant feedback)
- Production debugging (errors caught pre-deployment)

Validation provides fast, automated quality checks that scale across your entire lab catalog.
