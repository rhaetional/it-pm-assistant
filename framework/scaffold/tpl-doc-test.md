# SCAFFOLD: doc/test/

> **Status: DEFERRED**
> This scaffold is a placeholder. Test documentation is not in scope until
> `doc/Architecture.md` and `doc/system/*` are locked.
>
> **Derives from:** `doc/Spec.md` (NFRs) + `doc/Architecture.md` + `doc/system/*`
>
> **Skill:** `/testing-strategy`

---

## Intended Structure (provisional)

When activated, `doc/test/` will contain:

```
doc/test/
├── Strategy.md        # test approach, levels, environments, tooling
├── Cases.md           # test case specifications per operation domain
└── Results/           # test run records (appended, not overwritten)
    └── NNN-*.md
```

---

## Definition of Done (provisional)

- Every operation in Spec.md has at least one test case.
- Every NFR has a corresponding test or explicit exemption with rationale.
- Test environment constraints are documented and sourced.
- All must-have operations have both happy-path and failure-mode cases.

---

## Notes

<!--
Record any test-related constraints or decisions made during earlier phases here.
These will inform the test strategy when this scaffold is activated.
-->
