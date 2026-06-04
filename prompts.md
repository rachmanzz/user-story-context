# Prompts Reference

## Init Prompt

Copy `.ai-context/system-prompt.md` ke Custom Instructions AI, lalu mulai dengan:

```
I want to create user stories for [project name]
```

Atau dalam Bahasa Indonesia:

```
Saya mau buat user story untuk project [nama project]
```

> AI akan membaca system-prompt, lalu memulai Q&A 5 fase.

---

## Continuation Prompts

Setelah generate pertama, gunakan ini untuk perubahan tanpa reset Q&A.

### Add New Epic

```
Add new epic: {epic name}. 
Core flow: {description}. 
Priority: Must/Should/Could.
Read existing files in includes/ first.
```

### Change Priority

```
Change US-{N} priority to {Must/Should/Could}.
Read existing user-stories.md and epics.md first.
```

### Add AC or BDD

```
Add to US-{N}:
- AC: {new acceptance criteria}
- BDD: Scenario ... Given/When/Then
Read existing acceptance-criteria.md and bdd-scenarios.md first.
```

### Remove Epic / Story

```
Remove EPIC-{N} / US-{N}. 
Read all includes/ files, re-index IDs, update cross-references.
```

### Tech Revision

```
Change database from {old} to {new}.
Read technical-notes.md first, update relevant sections.
```

### Bulk Update

```
Read all files in includes/.
Then apply these changes:
1. {change 1}
2. {change 2}
```

---

## Pattern

```
Read {context file}
You are the {role}. Based on {file}, set up the following:
...
```
