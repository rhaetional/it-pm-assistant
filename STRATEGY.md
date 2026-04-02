# STRATEGY.md
<!-- Process governance: how documents are created, not what they contain. Agent instructions: framework/CLAUDE.md. -->
<!-- Path note: all paths below (doc/, decisions/, work/, manual/) are relative to the instance repo root, not to framework/. -->

## Guiding Star
<!-- TODO: one paragraph — what is this system, who is its primary user, what is the key outcome? Every document and decision derives from this. -->

## Document Hierarchy
Strict dependency order. Predecessor must be LOCKED before derivative begins.
```
doc/Overview.md      ← guiding star; source of truth for purpose + scope
doc/Spec.md          ← ← Overview
doc/Architecture.md  ← ← Spec
doc/system/*         ← ← Architecture
doc/test/*           ← ← Spec + Architecture  [deferred]
doc/Roadmap.md       ← ← Spec + Architecture
decisions/NNN-*.md   ← continuous; triggered by decisions at any phase
manual/              ← ← Spec + system/*      [deferred]
```

## Production Loop
Every document completes all steps before its successor begins.

**Step 1 — Schema**
Read `framework/scaffold/tpl-*.md` for this document. Template = required sections = definition of done. Do not extract until schema is understood.

**Step 2 — Inventory Extraction**  
Source: `work/inputs/NNN-*.md` → Output: `work/inventory/NNN-*.md` (one per input).  
Tag every extracted item:

| Tag | Meaning |
|---|---|
| `[REQUIREMENT]` | Stated or implied capability the system must have |
| `[CONSTRAINT]` | Boundary condition (system / process / organisational) |
| `[DECISION]` | Choice already made; may warrant ADR |
| `[MECHANISM]` | Proposed implementation approach |
| `[OPEN]` | Unresolved question requiring a decision |
| `[REJECTED]` | Ruled-out idea; keep with rationale |

Do not resolve conflicts here. Flag only.

**Step 3 — Conflict Map**  
Across all inventory files for this document, produce in `work/todo.md`:
- **Agreements** — consistent across sources
- **Contradictions** — sources conflict
- **Gaps** — schema-required but absent from all sources

**Step 4 — Resolution Pass**  
For each contradiction and gap: commit to a position. "It depends" only if the dependency is named and resolvable. Architecturally significant decisions → ADR immediately. Record rationale in `work/todo.md`.

**Step 5 — Draft**  
Populate scaffold from resolved inventory only (not raw inputs). Fill every required section. Unknown items → `<!-- UNKNOWN: reason -->`. No unresolved contradictions in the document.

**Step 6 — Adversarial Critique** (`/tech-debt`)  
Attempt to break the draft:
- Unstated assumptions?
- Missing constraints?
- Internal contradictions?
- What fails first under realistic conditions?

Record all findings in `work/todo.md`.

**Step 7 — Resolve and Lock**  
Address every critique item: fix it, or record a conscious decision not to with rationale. When done:
```
<!-- STATUS: LOCKED — DD.MM.YYYY -->
```
Post-lock changes → change record in `work/todo.md` only.

## Definition of Done
1. Every scaffold-required section is populated or marked `UNKNOWN`.
2. Every `[CONSTRAINT]` is attributed (system / process / decision) — not assumed.
3. Every `[OPEN]` has a resolution or recorded deferral.
4. Adversarial critique completed; all findings addressed.
5. No section contradicts another within the same document.

## ADR Trigger Criteria
Create `decisions/NNN-*.md` when:
- A choice is made between ≥2 technically viable alternatives.
- A constraint is accepted that limits future options.
- A prior decision is reversed.
- An `[OPEN]` is resolved with non-obvious reasoning.

Use `/architecture` skill for ADRs. ADRs are append-only; superseded decisions marked, not deleted.

## Skill Routing
| Step | Skill |
|---|---|
| Draft/update `doc/*` | `/documentation` |
| `doc/Spec.md` (steps 1–5: domain/operation analysis) | `/system-design` + `/documentation` |
| `doc/Architecture.md` or `doc/system/*` | `/system-design` |
| Create/review `decisions/NNN-*.md` | `/architecture` |
| Step 6 adversarial critique | `/tech-debt` |
| `doc/test/*` | `/testing-strategy` |

`doc/Spec.md` uses both skills in sequence: `/system-design` drives scope and content decisions (steps 1–5); `/documentation` handles the writing pass and lock review (steps 5–7).

## Open Points
See `work/todo.md` (instance) or `template-meta/todo.md` (framework).