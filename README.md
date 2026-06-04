# User Story Context

```bash
npx degit rachmanzz/user-story-context
```

AI asks 13 questions (5 phases), then generates 11+ files: `user-story.md` (map + traceability matrix) + `includes/*.md` (details per category) + export files + optional test boilerplate.

## Language Rule

| Mode | Language |
|------|----------|
| **Conversation** | Follows user's language (Indonesian / English) |
| **Generated files** | **Always English** |

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

--- or in Indonesian ---

Saya mau buat user story untuk project [nama project]
```

### 3. Answer 13 Questions (5 Phases)

| Phase | Topic | Questions |
|-------|-------|-----------|
| 1 | Project Context (name, problem, users, timeline) | 4 |
| 2 | Feature Breakdown (epics, flows, roles) | 3 |
| 3 | Technical & Constraints | 3 |
| 4 | Prioritization + Complexity Score | 3 |
| 5 | Quality Review (INVEST score 6/6) | Review |

After each phase, AI summarizes and asks for confirmation.

### 4. AI Generates 11+ Files (ALL in English)

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
# Update stories without re-running all 12 questions
# See .ai-context/update-workflow.md

# Audit drift: check if docs match codebase
./scripts/audit-sync.sh ./nama-feature ../src
```

## Directory Structure

```
.ai-context/                  ← AI prompts & workflows
├── system-prompt.md          ← Main prompt (5 phases, 11+ files, INVEST)
├── workflow.md               ← Interactive workflow diagram
└── update-workflow.md        ← Iterative update guide
templates/                    ← Output templates
├── user-story-map.md         ← + Traceability Matrix
├── includes/                 ← 8 category templates
│   └── decision-log.md       ← Decision records
├── exporters/                ← Export formats (CSV, JSON)
└── automation/               ← Test boilerplate (Cypress, Playwright, Cucumber)
contexts/                     ← Reusable context
├── personas/                 ← Persona library (admin, customer, template)
└── ui-states/                ← Global UI states definition
scenarios/                    ← Q&A scenario example
examples/                     ← Generated output examples
guides/                       ← Best practices
scripts/                      ← Utilities
└── audit-sync.sh             ← Documentation drift prevention
usc                           ← CLI scaffold tool
```

## CLI: `usc`

```bash
./usc init <name>       # Scaffold folder + template files
./usc list               # List all features
./usc help               # Show help
```

## Scripts

```bash
./scripts/audit-sync.sh <feature-dir> [codebase-dir]
# Checks: story coverage, broken links, UX state consistency
```
