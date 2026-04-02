# SCAFFOLD: manual/

> **Status: DEFERRED**
> This scaffold is a placeholder. User documentation is not in scope until
> `doc/system/*` is locked and the system is stable enough to document accurately.
>
> **Derives from:** `doc/Spec.md` + `doc/system/API.md` + `doc/system/Data Model.md`
>
> **Audience:** End-users, system administrators, and support staff.
> Manual lives outside `doc/` because it is a user-facing deliverable,
> not a design or engineering document.

---

## Intended Structure (provisional)

```
manual/
├── index.md              # entry point; audience guide (who reads what)
├── getting-started.md    # installation, setup, first use
├── operations/           # one file per major operation domain (mirrors Spec.md)
│   └── [domain].md
├── reference/            # lookup material: config options, error codes, constraints
│   ├── configuration.md
│   └── errors.md
└── admin/                # system administrator topics
    └── ...
```

---

## Definition of Done (provisional)

- Every user-facing operation in Spec.md is covered.
- Every error code defined in `doc/system/API.md` has a user-readable explanation and resolution step.
- Getting-started guide has been validated by at least one person unfamiliar with the system.
- No internal implementation detail exposed (manual describes behaviour, not mechanism).

---

## Notes

<!--
Record any user-experience constraints or audience decisions made during earlier phases here.
These will inform manual structure when this scaffold is activated.
-->
