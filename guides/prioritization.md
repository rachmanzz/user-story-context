# Prioritization Guide

Use **MoSCoW** method to prioritize user stories relative to project goals.

---

## MoSCoW Framework

### Must Have
Critical for launch. Without these, the solution is invalid.
- Core functionality
- Legal/regulatory requirements
- Non-negotiable stakeholder requirements
- *Example: User login, payment processing*

### Should Have
Important but not critical. Can be delivered via workaround.
- Adds significant value
- Painful to omit but still acceptable
- *Example: Social login, email notifications*

### Could Have
Nice to have. Small effort, visible value.
- Included if time/resources permit
- Lowest cost of delay
- *Example: Dark mode, export to PDF*

### Won't Have (this time)
Explicitly out of scope. Acknowledged but deferred.
- Low value vs. effort ratio
- Intentionally saved for future releases
- *Example: AI-powered recommendations, mobile app*

## Prioritization Matrix

| Value | Effort | Priority |
|-------|--------|----------|
| High | Low | Must Have |
| High | High | Should Have |
| Low | Low | Could Have |
| Low | High | Won't Have |

## Additional Factors

- **Dependencies**: A "Won't Have" might become "Must Have" if blocking
- **Risk**: High-risk items may be scheduled earlier (fail fast)
- **User Impact**: Number of users affected
- **Revenue Impact**: Direct or indirect revenue
- **Strategic Alignment**: Fit with product vision/roadmap
