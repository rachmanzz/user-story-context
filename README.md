# User Story Context

```bash
npx degit rachmanzz/user-story-context
```

AI guides a structured discovery process through **5 phases** (~13 discovery questions), then generates **11+ files**: `user-story.md` (map + traceability matrix) + `includes/*.md` (details per category) + export files + optional test boilerplate.

---

## Why?

Most AI-generated user stories suffer from:

- **Missing acceptance criteria** — AI writes stories but forgets edge cases
- **Inconsistent terminology** — "Admin" in one story, "Super Admin" in another
- **No traceability** — Can't link stories to business goals or tests
- **Difficult export** — Manual copy-paste to Jira or GitHub Issues
- **Requirements drift** — Stories diverge from implementation over time

User Story Context solves this by **asking first, generating later** — guiding AI through structured discovery before producing artifacts.

---

## Language Rule

| Mode | Language |
|------|----------|
| **Conversation** | Follows user's language (Indonesian / English) |
| **Generated files** | Always English |

---

## How to Use

### 1. Setup AI

```bash
# Optional: scaffold folder for new feature
./usc init <feature-name>
```

Copy `.ai-context/system-prompt.md` into your AI assistant's **Custom Instructions**.

### 2. Start Session

```
I want to create user stories for [project name]
```

Or in Indonesian:

```
Saya mau buat user story untuk project [nama project]
```

### 3. Answer ~13 Questions (5 Phases)

| Phase | Topic | Questions |
|-------|-------|-----------|
| 1 | Project Context (name, problem, users, timeline) | 4 |
| 2 | Feature Breakdown (epics, flows, roles) | 3 |
| 3 | Technical & Constraints | 3 |
| 4 | Prioritization + Complexity Score | 3 |
| 5 | Quality Review (INVEST — see below) | Review |

After each phase, AI summarizes and asks for confirmation.

### 4. AI Generates 11+ Files (All in English)

```
user-story.md              ← Map + Traceability Matrix + TOC
includes/
├── epics.md               ← Epic definitions & business goals
├── user-stories.md        ← All user stories + complexity score
├── acceptance-criteria.md ← AC per story
├── bdd-scenarios.md       ← Gherkin scenarios (+ Mermaid diagram)
├── technical-notes.md     ← Stack, architecture, constraints
├── ux-notes.md            ← UI/UX + Mermaid + global states
├── decision-log.md        ← Decision records (DL-1, DL-2)
├── revision-history.md    ← Version history & changelog
└── glossary.md            ← Domain terms & acronyms
jira-import.csv            ← Jira-ready import
github-issues.json         ← GitHub-ready import
[optional] test.cy.js      ← Test boilerplate (Cypress/Playwright/Cucumber)
```

### 5. Update or Audit

```bash
# Update stories without re-running all questions
# See .ai-context/update-workflow.md

# Detect documentation drift
./scripts/audit-sync.sh ./my-feature ../src
```

---

## Quality: INVEST Principles

Before generating, AI reviews each story against **INVEST**:

| Letter | Criterion | Meaning |
|--------|-----------|---------|
| **I** | Independent | Can it be delivered alone? |
| **N** | Negotiable | Is there room for discussion? |
| **V** | Valuable | Does it deliver user/business value? |
| **E** | Estimable | Can the team estimate effort? |
| **S** | Small | Can it fit in one sprint? |
| **T** | Testable | Are acceptance criteria clear? |

Each story gets a score (e.g. 6/6). If any criterion fails, AI suggests a fix before generating.

---

## Documentation Drift Detection

As projects evolve, user stories often diverge from implementation. `scripts/audit-sync.sh` performs automated checks for:

- **Missing references** — Epics without corresponding stories
- **Broken links** — Cross-references in `user-story.md` pointing to nonexistent files
- **UX state inconsistencies** — Loading/empty/error states mentioned inconsistently across stories
- **Test coverage gaps** (optional) — Story IDs not found in codebase test files when a codebase directory is provided

```bash
./scripts/audit-sync.sh <feature-dir> [codebase-dir]
```

---

## Example

**Input:** `I want to build a task management application for small teams.`

**Output after Q&A:** 3 Epics, 14 User Stories, 47 Acceptance Criteria, plus export files.

See [`examples/`](examples/) for a complete generated output sample (login feature).

---

## Directory Structure

```
.ai-context/                  ← AI prompts & workflows
├── system-prompt.md          ← Main prompt (5 phases, 11+ files, INVEST)
├── workflow.md               ← Interactive workflow diagram
└── update-workflow.md        ← Iterative update guide
templates/                    ← Output templates
├── user-story-map.md         ← + Traceability Matrix
├── includes/                 ← 8 category templates
├── exporters/                ← Export formats (CSV, JSON)
└── automation/               ← Test boilerplate (Cypress, Playwright, Cucumber)
contexts/                     ← Reusable context
├── personas/                 ← Persona library
└── ui-states/                ← Global UI states definition
scenarios/                    ← Q&A scenario example
examples/                     ← Generated output examples
guides/                       ← Best practices
prompts.md                    ← Init & continuation prompts reference
scripts/                      ← Utilities
└── audit-sync.sh             ← Documentation drift detection
usc                           ← CLI scaffold tool
```

## CLI: `usc`

```bash
./usc init <name>       # Scaffold folder + template files
./usc list               # List all features
./usc help               # Show help
```
