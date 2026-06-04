# Interactive Q&A Workflow

```
  ┌─────────────────────────────────────────────┐
  │  START: User describes feature/project       │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  LANGUAGE RULE                               │
  │  ├─ Conversation: follow user's language     │
  │  └─ Output files: ALWAYS English             │
  └─────────────────────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  PHASE 1: Project Context (4 questions)      │
  │  + refer contexts/personas/                  │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  PHASE 2: Feature Breakdown (3 questions)    │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  PHASE 3: Technical & Constraints (3 q)      │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  PHASE 4: Prioritization + Estimation (3 q)  │
  │  + Preliminary Complexity Score              │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  PHASE 5: Quality Review (INVEST Check)      │
  │  Score table + split suggestions             │
  └──────────────┬──────────────────────────────┘
                 ▼
  ┌─────────────────────────────────────────────┐
  │  GENERATE (11+ files, ALL in English):       │
  │  ├── user-story.md (map + Traceability Mtx)  │
  │  ├── includes/ (8 files)                     │
  │  ├── jira-import.csv                        │
  │  ├── github-issues.json                     │
  │  └── [optional] test boilerplate            │
  └─────────────────────────────────────────────┘
```

## Phases Summary

| Phase | Questions | Output |
|-------|-----------|--------|
| 1: Context | 4 | Product name, problem, users, timeline |
| 2: Features | 3 | Epics, flows, roles |
| 3: Technical | 3 | Platform, constraints, perf/security |
| 4: Prioritization | 3 | MoSCoW, dependencies, complexity scores |
| 5: Quality Review | INVEST checklist | Score per story, split suggestions |

## Rules for the AI

1. **One phase at a time.** Do not proceed until user answers.
2. **Ask 2-4 questions per turn.** Do not dump all questions at once.
3. **Summarize answers** before moving to next phase.
4. **Language:** converse in user's language, generate output in English.
5. **INVEST review** in Phase 5 — present score table, ask for confirmation.
6. **Offer test boilerplate** after main generation (optional).
7. **Generate ALL files** in one go after confirmation.

## Updates (Iterative)

For changes after generation, use `.ai-context/update-workflow.md`.
For drift audit, run `scripts/audit-sync.sh <feature-dir> [codebase-dir]`.
