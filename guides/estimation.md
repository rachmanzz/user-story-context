# Estimation Guide

Use **Story Points** for relative estimation based on complexity, effort, and uncertainty.

---

## Point Scale

| Points | Meaning | Time Approximation | Example |
|--------|---------|-------------------|---------|
| 1 | Trivial | < 2 hours | Text change, bug fix |
| 2 | Simple | 2-4 hours | Form with basic validation |
| 3 | Medium | 1 day | CRUD for single entity |
| 5 | Large | 2-3 days | Multi-step flow, API integration |
| 8 | Very Large | 4-5 days | Feature with complex logic |
| 13 | Too Large | > 1 week | Must be split into smaller stories |

## Estimation Technique: Planning Poker

1. Team discusses the story briefly
2. Each member secretly selects a point value
3. Cards revealed simultaneously
4. Discuss outliers (highest and lowest)
5. Re-vote until consensus

## Factors to Consider

- **Complexity**: How hard is the logic/code?
- **Effort**: How much work is involved?
- **Uncertainty**: How much do we NOT know?
- **Dependencies**: Blocked by other work?

## When to Split a Story

Split if:
- Story is estimated > 8 points
- Story has multiple independent acceptance criteria
- Story covers multiple user roles
- The team cannot agree on an estimate
