# Example: Q&A Session — Login Feature

This example shows an Indonesian Q&A session. The conversation follows the user's language, but all generated output files are in English.

---

## Q&A Phase (in Indonesian — follows user's language)

**AI:** Apa nama project dan masalah utama yang ingin diselesaikan?

**User:** "Aplikasi e-commerce 'TokoKita'. Masalahnya: user belum bisa login."

**AI:** Siapa target user dan role-nya?

**User:** "Pembeli (customer) dan Admin toko."

**AI:** Platform apa? Ada constraint teknis?

**User:** "Web. Pakai JWT. Integrasi Google OAuth."

**AI:** Prioritaskan fiturnya?

**User:** "Login email wajib. OAuth kalo sempat. Lupa password wajib."

---

## Generated Output (ALL in English)

```
user-story.md              ← Map/index (English)
includes/
├── epics.md               ← EPIC-1 definition (English)
├── user-stories.md        ← US-1, US-2, US-3 (English)
├── acceptance-criteria.md ← AC per story (English)
├── bdd-scenarios.md       ← Gherkin scenarios (English)
├── technical-notes.md     ← JWT, OAuth, etc. (English)
├── ux-notes.md            ← login page, flow (English)
├── decision-log.md        ← decisions (English)
├── revision-history.md    ← changelog (English)
└── glossary.md            ← terms (English)
jira-import.csv            ← Jira-ready (English)
github-issues.json         ← GitHub-ready (English)
```

See `examples/includes/` for the actual English content.
