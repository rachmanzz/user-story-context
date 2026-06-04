# Iterative Update Workflow

Use this when a user wants to **update** existing user stories without repeating all 12 questions.

## Trigger

Users will say things like:
- "Add new feature: {feature name}"
- "Change US-2 priority to Must Have"
- "Add acceptance criteria for US-1"
- "Remove EPIC-3, not doing it"

## Workflow

### 1. Read Existing Files
Ask user to share the files to be modified, or request the file path.

### 2. Identify Change Type

| Type | Example | Action |
|------|---------|--------|
| **New Epic** | "New feature: export report" | Add EPIC-N, generate new stories, update user-story.md map, update exporters |
| **Priority change** | "US-2 should be Should" | Update user-stories.md, epics.md, user-story.md |
| **Add AC/BDD** | "US-1 needs AC: phone validation" | Add to acceptance-criteria.md, bdd-scenarios.md |
| **Remove** | "EPIC-3 cancelled" | Remove from all files, re-index IDs |
| **Tech revision** | "Change database from PostgreSQL to MongoDB" | Update technical-notes.md |

### 3. Update Files

Only update relevant files. Do not regenerate everything.

### 4. Validate

Ensure:
- IDs are consistent (no duplicates)
- Cross-reference links in user-story.md are still valid
- Exporters CSV/JSON are in sync with changes

### 5. Output

Show a diff summary of changes:

```
Changes:
  + EPIC-4: Export Report (Priority: Could)
  + US-8, US-9 (in EPIC-4)
  ~ US-1: added 2 ACs
  ~ user-story.md: updated TOC & story count
  ~ jira-import.csv: added US-8, US-9
```
