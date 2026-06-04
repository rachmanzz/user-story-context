# UX Notes

---

## Design Principles

- {principle 1}
- {principle 2}

---

## EPIC-1: {Epic Title}

### US-1: {Story Title}
- **Screen:** {screen/page name}
- **States:** loading, empty, error, success
- **Interaction:** {click, swipe, type...}
- **Accessibility:** {keyboard nav, screen reader...}

### US-2: {Story Title}
- **Screen:** {screen/page name}
- **States:** loading, empty, error, success

---

## User Flow (Mermaid)

```mermaid
graph TD
  A[Screen A] --> B[Screen B]
  B --> C[Screen C]
  B --> D[Screen D]
```

## Sequence Diagram (Mermaid)

```mermaid
sequenceDiagram
    actor User
    participant Frontend
    participant API
    participant DB

    User->>Frontend: Action
    Frontend->>API: Request
    API->>DB: Query
    DB-->>API: Result
    API-->>Frontend: Response
    Frontend-->>User: Result
```

---

## Design References

- {Figma link or description}
