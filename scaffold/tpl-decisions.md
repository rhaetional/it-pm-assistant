# SCAFFOLD: decisions/NNN-*.md

> **Purpose of this template:** Standard structure for all Architecture Decision Records.
> ADRs are append-only. A superseded ADR is updated with a SUPERSEDED status and a
> reference to its replacement — it is never deleted or rewritten.
>
> **Naming:** `decisions/NNN-[short-slug].md` — e.g. `decisions/001-persistence-layer.md`
>
> **Trigger criteria (from STRATEGY.md):**
> - A choice is made between two or more technically viable alternatives.
> - A constraint is accepted that limits future options.
> - A previously recorded decision is reversed.
> - An open question from the conflict map is resolved with non-obvious reasoning.
>
> **Skill:** `/architecture`

---

<!-- STATUS: PROPOSED | ACCEPTED | SUPERSEDED | DEPRECATED — DD.MM.YYYY -->
<!-- SUPERSEDED BY: decisions/NNN-*.md -->  <!--  remove if not applicable -->

# ADR-NNN: [Decision Title]

**Date:** DD.MM.YYYY
**Status:** PROPOSED | ACCEPTED | SUPERSEDED | DEPRECATED
**Decider(s):** [Name / role]
**Document context:** [Which doc/* file triggered this decision]

---

## Context

<!--
Describe the situation that requires a decision.
Include:
- What problem needs solving
- What constraints or requirements apply (reference Spec.md CON-xxx or NFR-xxx IDs)
- What triggered this decision now (not earlier, not later)

Be factual. Do not pre-argue for the chosen option here.
-->

---

## Decision

<!--
State the decision in one sentence.
Start with: "We will..."

Then explain the reasoning in 2–4 sentences. Focus on why this option was chosen
over the alternatives, not on describing what the option is.
-->

We will...

---

## Consequences

<!--
What changes as a result of this decision?
Split into positive and negative consequences.
Be honest about trade-offs — this is the most important section for future readers.

### Positive
- 

### Negative / Trade-offs
-

### Constraints introduced
<!--
List any new constraints this decision imposes on future decisions.
These should be carried into Spec.md or Architecture.md as CON-xxx items.
-->
-->

### Positive

### Negative / Trade-offs

### Constraints introduced

---

## Alternatives Considered

<!--
For each alternative:

### [Alternative Name]
- **Description:** What it is.
- **Pros:** What speaks in favour of this option.
- **Cons:** What speaks against it.
- **Why not chosen:** The specific reason this was rejected in this context.
  Avoid generic reasons ("too complex") — state the actual trade-off.
-->

### [Alternative Name]

- **Description:**
- **Pros:**
- **Cons:**
- **Why not chosen:**

---

## Trade-off Analysis

<!--
Summarise the cross-cutting reasoning that led to the decision above.
This section is distinct from the per-alternative assessments — it explains
why the chosen option wins on the dimensions that matter most in this context.

Consider:
- Which dimensions were decisive (e.g. operational complexity outweighed cost)?
- What would need to change for a different option to become preferable?
- What is accepted as a known cost of this decision?
-->

---

## References

<!--
Link to related ADRs, Spec.md sections, or external sources that informed this decision.
-->
