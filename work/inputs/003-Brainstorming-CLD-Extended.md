## Core tension first

JIRA is optimised for delivery-oriented, decomposable work with measurable progress. EA and process improvement work is often exploratory, iterative, and produces *documentation* rather than deployable increments. Forcing it into the same workflow creates friction. The fix isn't a different tool — it's intentional issue type design and a clear JIRA↔Confluence contract.

---

## Work type taxonomy

Before mapping to tools, distinguish the three work modes you're dealing with:

| Mode | Cadence | Primary output | PM challenge |
|---|---|---|---|
| Software delivery | Sprint/Kanban | Deployable increment | Scope, velocity, dependencies |
| Architecture documentation | Milestone-driven | Living Confluence pages | Completeness, staleness, ownership |
| Process improvement | Phase-gated | Changed behaviour + runbooks | Adoption, measurement, change resistance |

Each needs a slightly different JIRA structure.

---

## JIRA design

### Issue type hierarchy

Don't flatten everything into Story/Task. Define:

- **Initiative** (or use Portfolio Epic) — cross-project alignment (e.g. "Migrate JDE to Azure")
- **Epic** — bounded body of work with a clear outcome (e.g. "Document current-state integration architecture")
- **Architecture Task** — custom type for EA-specific work items: ADR drafting, capability assessment, stakeholder review
- **Story / Task / Bug** — standard for dev work
- **Process Improvement Item** — optionally a custom type, or label-driven

Rationale: mixing EA tasks with dev stories in the same backlog obscures both. Separate issue types allow separate workflows and different "Definition of Done".

### Workflow states for EA/process work

Standard dev workflow doesn't fit. For architecture tasks, consider:

```
Backlog → In Analysis → Draft → In Review → Accepted → Published → Superseded
```

"Published" = Confluence page is live and linked. "Superseded" = an ADR has been replaced by a newer one. Tracking supersession in JIRA avoids the Confluence graveyard problem.

### Components = architectural domains

Map JIRA Components to your capability/domain model (Integration, Data, Security, Platform, etc.) rather than teams. This gives you cross-team, domain-filtered views — critical for EA work that cuts across delivery teams.

### Board type

- Kanban for EA and process work (continuous flow, no artificial sprint pressure)
- Scrum for delivery teams (if that's your standard)

Keep them in separate projects or at least separate boards.

---

## Confluence structure

### Space design

Avoid initiative-based spaces — they go stale when the initiative closes. Use **domain-based spaces** that outlive projects:

```
Enterprise Architecture (root space)
├── Integration Architecture
├── Data & Analytics
├── Security Architecture
├── Platform & Infrastructure
└── Decisions (cross-cutting ADR index)

Projects (separate space)
├── JDE-Azure Migration
├── GoAnywhere Modernisation
└── ...
```

Initiative/project spaces are acceptable for time-bounded delivery work. Architecture spaces should be durable.

### Templates worth enforcing

| Template | Key sections | Linked to JIRA |
|---|---|---|
| ADR | Status, Context, Decision, Consequences, Alternatives | Yes — linked Epic or Task |
| Capability Assessment | Current state, gaps, target state, owners | Yes — linked Epic |
| Design Doc | Problem, constraints, options, decision, NFRs | Yes — linked Epic |
| Process Description | As-Is, To-Be, RACI, metrics | Yes — linked Process Improvement Epic |
| Meeting Notes | Decisions (explicit section), Actions → JIRA | Yes — actions become JIRA tasks |

### Page Properties macro

Use it on every architecture page. Define a consistent schema:

```
Status: [Draft | In Review | Approved | Superseded]
Owner: @person
Domain: Integration
Last reviewed: DD.MM.YYYY
Next review: DD.MM.YYYY
JIRA Epic: PROJ-123
```

Then use **Page Properties Report** macro on index pages to get a queryable dashboard of your architecture coverage. This is how you fight the graveyard — you can see at a glance what's stale.

---

## The JIRA↔Confluence contract (most important)

The integration only pays off if you enforce a bidirectional link discipline:

**Every JIRA Epic must link to a Confluence page** — the design brief, architecture doc, or process description. This is the "source of truth" for context and rationale that JIRA can't hold.

**Every Confluence architecture page must embed a JIRA filter** showing open work in that domain. Use the JIRA Issues macro. This keeps Confluence from becoming purely retrospective.

**Definition of Done for EA/process work must include documentation**:
- ADR written (if a significant decision was made)
- Confluence page updated and status set to Approved
- JIRA closed with link to Confluence page in description or comment

Without this in the DoD, the doc update never happens.

---

## Typical workflow: Architecture Documentation Initiative

```
Input: gap assessment / audit finding / stakeholder request
  ↓
JIRA: Create Epic, link to a new Confluence "Architecture Brief" page
  ↓
Break into Architecture Tasks per domain/capability
  ↓
Each task: draft Confluence page (current state → gap → target state)
  ↓
Review cycle: JIRA task moves Draft → In Review → Accepted
  ↓
Publish: Confluence page status = Approved, JIRA closed
  ↓
Scheduled review cycle: Confluence Page Properties review date triggers new JIRA task
```

## Typical workflow: Process Improvement

```
Input: pain point, maturity assessment, tooling change
  ↓
JIRA Epic with four child Epics: Analyse / Design / Implement / Measure
  ↓
Confluence: As-Is process doc (create early), To-Be doc (create during Design)
  ↓
Implementation tasks in JIRA linked to specific process steps
  ↓
Runbook / SOP updated in Confluence before Epic closes
  ↓
Measure Epic: JIRA tasks for metric collection, retrospective page in Confluence
```

---

## Pitfalls to call out explicitly

**JIRA as a graveyard** — epics opened, never closed, no Confluence link. Fix: weekly triage ritual, mandatory Confluence link on Epic creation.

**Confluence as a graveyard** — pages created, never updated. Fix: Page Properties with review dates, automated Confluence space audits (you can script this via REST API).

**ADRs not written** — decisions made in meetings, never recorded. Fix: meeting notes template forces a "Decisions" section; each decision item spawns a JIRA task to write the ADR.

**EA work mixed into dev backlogs** — invisible to architects, noisy for developers. Fix: separate JIRA project or at minimum a dedicated component + board filter.

---

Want to go deeper on any specific slice — ADR workflow, the Confluence automation angle (you've built label-normalisation scripts before), or structuring a specific initiative type?