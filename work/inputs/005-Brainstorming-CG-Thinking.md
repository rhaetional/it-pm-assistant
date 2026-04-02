Adopt a **single operating model** with two artefact classes:

* **Jira** = accountable work and portfolio flow
* **Confluence** = durable knowledge, decisions, standards, and architecture state

Below is a concrete setup you can implement with limited customisation.

# 1. Jira model

## 1.1 Project strategy

Do **not** create one Jira project per initiative.

Use Jira projects by **durable domain or portfolio boundary**, for example:

* `EA` — Enterprise Architecture and standards
* `ERP` — ERP and core business systems
* `INT` — Integrations and data exchange
* `OPS` — IT process and operational improvement
* `PLT` — Shared platforms / infrastructure

Reason: projects should reflect long-lived ownership and permissions, not temporary efforts.

---

## 1.2 Issue hierarchy

Use this hierarchy:

### Level 1 — Initiative

Cross-team or multi-quarter outcome.

Examples:

* Standardise product master data ownership
* Rationalise terminal integration patterns
* Improve architecture documentation quality across ERP and interfaces
* Unify approval workflow across regions

### Level 2 — Epic

A coherent work package within an initiative.

Examples:

* Current-state assessment
* Target-state design
* Process redesign
* Interface remediation
* Rollout and adoption
* Documentation uplift

### Level 3 — Delivery / architecture work items

These are the operational units.

Recommended issue types:

* **Story** — user- or behaviour-facing change
* **Task** — generic execution work
* **Bug** — defect
* **Assessment** — analyse current state, gap, dependency, or risk
* **Decision** — work item to produce or ratify an ADR / decision
* **Improvement** — process or control enhancement
* **Risk** — explicit risk requiring treatment or decision
* **Dependency** — external input or blocker requiring tracking
* **Documentation** — creation or update of architecture / operational docs

### Level 4 — Sub-task

Use sparingly.

Only use when:

* one accountable item needs a few execution steps
* all steps belong to the same owner context
* you do not want separate prioritisation

Do **not** use subtasks to simulate process phases.

---

## 1.3 When to use each issue type

### Initiative

Use when all are true:

* spans multiple epics or teams
* has a business or architectural outcome
* requires roadmap visibility
* needs steering / sponsorship

### Epic

Use when:

* a coherent slice can be delivered or assessed semi-independently
* it groups 5–30 work items
* it produces a visible output

### Assessment

Use for:

* current-state mapping
* application fit/gap analysis
* integration inventory
* process bottleneck analysis
* architecture review
* data ownership analysis

Output should be a Confluence artefact, not just a closed ticket.

### Decision

Use when:

* a meaningful architectural, process, or control decision must be made
* options and trade-offs exist
* downstream work depends on the result

Output should be an ADR or equivalent decision record in Confluence.

### Improvement

Use for:

* process improvement
* governance improvement
* control implementation
* standardisation
* documentation uplift

### Documentation

Use when documentation is itself the work product and needs explicit ownership.

Examples:

* create current-state interface map
* update support runbook
* document target-state process
* produce reference architecture page

---

# 2. Jira workflows

Keep workflows simple. Complexity belongs in fields and conventions.

## 2.1 Default workflow for most work items

Use:

* **Backlog**
* **Ready**
* **In Progress**
* **In Review**
* **Blocked**
* **Done**
* **Cancelled**

### Meaning

* **Backlog** — captured, not ready
* **Ready** — sufficiently defined, can start
* **In Progress** — active work underway
* **In Review** — review, approval, or validation pending
* **Blocked** — external blocker or unresolved dependency
* **Done** — output accepted and documentation complete
* **Cancelled** — intentionally stopped

Do not create statuses like:

* waiting for business
* waiting for architect
* ready for testing
* ready for release
* pending documentation

Those are better expressed by:

* assignee / reviewer
* linked dependency
* labels / custom fields
* checklist in definition of done

---

## 2.2 Workflow for Initiatives and Epics

Use a slightly more governance-oriented flow:

* **Proposed**
* **Qualified**
* **Approved**
* **In Progress**
* **At Risk**
* **Done**
* **Stopped**

### Meaning

* **Proposed** — captured, not yet shaped
* **Qualified** — problem, scope, owner, and expected outcome are defined
* **Approved** — authorised to consume capacity
* **In Progress** — delivery or analysis underway
* **At Risk** — material threat to scope, date, quality, or decision path
* **Done** — closed with evidence
* **Stopped** — formally discontinued

Do not use workflow status as portfolio ranking. Use prioritisation fields instead.

---

# 3. Jira fields

This is where the model becomes useful.

## 3.1 Mandatory fields for Initiative

* **Outcome statement**
  One sentence. Clear and testable.
* **Business owner**
* **Technical owner**
* **Architect owner**
  Optional if not separate.
* **Target review date**
* **Priority**
* **Domain / capability**
* **Change class**
* **Affected systems**
* **Success metric**
* **Confluence hub link**

### Example

* Outcome statement: Reduce duplicate customer master ownership decisions across ERP and integration landscape
* Success metric: Approved ownership model, source-of-truth defined for all customer domains, duplicate maintenance eliminated in 2 systems

---

## 3.2 Mandatory fields for Epic

* **Parent initiative**
* **Epic objective**
* **Owner**
* **Affected process**
* **Affected applications**
* **Deliverable type**
* **Confluence page link**
* **Target milestone**

### Deliverable type values

* Analysis
* Decision
* Design
* Build
* Rollout
* Documentation
* Governance

---

## 3.3 Mandatory fields for work items

* **Work type**
* **Owner**
* **Priority**
* **Due date or review date**
* **Affected system**
* **Affected process**
* **Documentation link**
* **Definition of done**
* **Change class**

### Change class values

* Process
* Application
* Integration
* Data
* Infrastructure
* Documentation
* Standard
* Governance
* Control

---

## 3.4 Recommended custom fields

Use a compact controlled vocabulary.

### Domain / capability

Examples:

* Order to Cash
* Procure to Pay
* Inventory
* Pricing
* Trading
* Logistics
* Finance
* Identity and Access
* Data Management
* Integration Platform

### Architecture layer

* Business
* Process
* Application
* Data
* Integration
* Technology

### Decision impact

* Local
* Cross-team
* Cross-domain
* Enterprise-wide

### Risk level

* Low
* Medium
* High
* Critical

### Evidence required

* ADR
* Diagram
* Process map
* Test proof
* Runbook update
* Standard update
* Training material

---

# 4. Jira linking conventions

Make links semantically meaningful.

## 4.1 Required link types

Use these consistently:

* **blocks / is blocked by**
* **relates to**
* **implements**
* **is decision input for**
* **follows from**
* **duplicates**

If custom link labels are allowed, these are useful:

* **documents / is documented by**
* **governed by**
* **supersedes**
* **derives from**

---

## 4.2 Minimal linking rules

### Every Initiative must link to:

* one Confluence hub page
* at least one Epic

### Every Epic must link to:

* its parent Initiative
* one main Confluence page
* related ADR pages if architectural choices exist

### Every Decision item must link to:

* the ADR page
* the Epic or Initiative it supports
* affected implementation items

### Every Documentation item must link to:

* the Confluence page created or updated

This is enough to preserve traceability without overloading teams.

---

# 5. Confluence structure

Use **spaces by durable ownership area**, not by project.

Example spaces:

* Enterprise Architecture
* ERP
* Integrations
* IT Operations / Processes
* Data / Reporting

Inside each relevant space, use a standard tree.

## 5.1 Standard page tree per initiative

```text
Initiatives
  <Initiative Name>
    01 Overview
    02 Scope and objectives
    03 Stakeholders and governance
    04 Current state
    05 Target state
    06 Decisions (ADR index)
    07 Requirements and constraints
    08 Delivery plan and dependencies
    09 Risks and assumptions
    10 Evidence and outcomes
    11 Meeting notes and workshops
    12 Retrospective / lessons learned
```

Do not force all content into one page.
Use the top page as the navigation hub.

---

## 5.2 Standard page tree for architecture knowledge

```text
Architecture
  Principles
  Standards
  Reference Architectures
  System Landscapes
  Integration Catalogue
  Data Ownership
  ADRs
  Reviews
```

This should outlive any single initiative.

---

## 5.3 Standard page tree for process knowledge

```text
Processes
  Process Catalogue
  Current-State Processes
  Target-State Processes
  Roles and Ownership
  Controls
  SOPs / Work Instructions
```

---

# 6. Confluence templates

Below are the templates I would actually standardise.

---

## 6.1 Initiative hub template

### Purpose

Single anchor for navigation, governance, and traceability.

### Sections

#### Summary

* Objective
* Outcome statement
* Sponsor
* Initiative owner
* Architect
* Start date
* Target review date
* Jira Initiative link

#### Scope

* In scope
* Out of scope
* Constraints
* Assumptions

#### Why this exists

* Problem statement
* Business or architecture driver
* Impact of not acting

#### Deliverables

* Expected outputs
* Non-goals

#### Linked content

* Jira roadmap / filter
* Epics
* ADR index
* Key architecture pages
* Risks
* Decision log

#### Status narrative

* Current state
* Main risks
* Decisions needed next
* Recent changes

---

## 6.2 Current-state assessment template

### Sections

* Purpose of assessment
* Scope boundary
* Systems in scope
* Processes in scope
* Stakeholders consulted
* Current-state narrative
* Pain points / defects / inefficiencies
* Known workarounds
* Risks and control gaps
* Dependencies
* Supporting diagrams
* Findings
* Recommendations
* Open questions

### Output quality rule

This page must let a new architect or PM understand the actual present system without oral transmission.

---

## 6.3 Target-state design template

### Sections

* Objective
* Design principles
* Scope and exclusions
* Target operating model
* Target process
* Target application / integration landscape
* Data ownership and flow
* Controls and governance
* Transition considerations
* Risks
* Open issues
* Related ADRs
* Linked Jira implementation items

---

## 6.4 ADR template

Use one page per decision.

### Sections

* Title
* Status
  Proposed / Accepted / Superseded / Rejected
* Date
* Owner
* Related initiative / epic
* Context
* Decision
* Options considered
* Trade-offs
* Consequences
* Implementation implications
* Exceptions / follow-up
* Linked Jira items
* Related standards / diagrams

### Rule

If the decision changes behaviour across more than one team or system, record it.

---

## 6.5 Standard / reference architecture template

### Sections

* Purpose
* Scope
* Applicability
* Mandatory rules
* Recommended patterns
* Prohibited patterns
* Exceptions process
* Examples
* Related ADRs
* Review cadence
* Owner

This is how architecture governance becomes operational instead of ceremonial.

---

## 6.6 Process design template

### Sections

* Problem statement
* Current-state summary
* Future-state process
* Roles and responsibilities
* System touchpoints
* Input / output artefacts
* Controls
* Exceptions handling
* KPIs
* Implementation implications
* Training / adoption needs
* Linked Jira items

---

## 6.7 Architecture review template

### Sections

* Review scope
* Artefacts reviewed
* Review participants
* Findings
* Risks
* Non-conformities against standards
* Decision / disposition
* Required follow-up
* Linked Jira actions

---

# 7. Workflow between Jira and Confluence

This is the operational loop.

## 7.1 Start of initiative

### In Confluence

Create:

* Initiative hub
* Scope / objectives
* Current-state page, if not already available

### In Jira

Create:

* Initiative
* first Epics
* initial Assessments / Decisions / Improvements

### Rule

No initiative moves from **Proposed** to **Qualified** unless the Confluence hub exists.

---

## 7.2 Analysis phase

### In Confluence

Produce:

* current-state assessment
* diagrams
* initial risks
* assumptions
* option analysis

### In Jira

Track:

* assessment tasks
* stakeholder workshops
* data collection
* dependencies
* decision items

### Rule

Do not close an Assessment ticket unless its Confluence output exists and is linked.

---

## 7.3 Design / decision phase

### In Confluence

Produce:

* target-state page
* ADRs
* standards updates if needed

### In Jira

Track:

* decision issue(s)
* review actions
* implementation epics
* exception handling

### Rule

Do not start delivery items whose behaviour depends on a decision that has not been recorded.

---

## 7.4 Delivery / implementation phase

### In Confluence

Update:

* target-state page if design evolved
* operational guidance
* runbooks
* standards
* process pages

### In Jira

Track:

* stories / tasks / bugs / rollout tasks
* blockers and dependencies
* documentation tasks explicitly

### Rule

Documentation updates are not implicit. Create explicit items for them.

---

## 7.5 Closure phase

### In Confluence

Capture:

* final architecture state
* final process state
* decision status
* evidence of outcome
* lessons learned

### In Jira

Close:

* initiative and epics only after evidence is linked

### Rule

“Done” means:

* implementation complete
* documentation updated
* decisions finalised
* operational impact captured

---

# 8. Board and view design in Jira

Use views for different management needs.

## 8.1 Delivery board

Filters:

* Stories
* Tasks
* Bugs
* Documentation
* Improvements in active epics

Columns:

* Backlog
* Ready
* In Progress
* In Review
* Blocked
* Done

Use for team-level execution.

---

## 8.2 Architecture / improvement board

Filters:

* Assessments
* Decisions
* Improvements
* Risks
* Dependencies
* Documentation

Use for:

* enterprise architecture
* process optimisation
* governance work
* non-code change streams

This prevents architecture work from disappearing behind build tickets.

---

## 8.3 Initiative roadmap / plans view

Show:

* Initiatives
* Epics
* target dates
* dependencies
* status
* owner

Use for portfolio steering.

---

# 9. Definition of done by issue type

This matters more than extra workflow statuses.

## 9.1 Assessment — done when

* scope covered
* findings documented
* recommendation stated
* Confluence page linked
* follow-up items created if needed

## 9.2 Decision — done when

* ADR completed
* review completed
* decision status explicit
* linked work items created or updated

## 9.3 Improvement — done when

* change implemented
* process or control documented
* owner accepts result
* evidence linked

## 9.4 Documentation — done when

* content exists in the correct Confluence location
* page is understandable without oral context
* links to impacted systems / work items are present
* owner assigned for future maintenance

## 9.5 Epic — done when

* its deliverable exists
* all child work items are closed or explicitly removed
* linked docs updated
* unresolved residual risks are transferred explicitly

---

# 10. Governance model

Keep it lean. Three control points are enough.

## 10.1 Qualify gate

Required to move Initiative from Proposed to Qualified:

* problem statement exists
* owner exists
* scope exists
* hub page exists
* expected outcome exists

## 10.2 Start gate

Required before significant implementation:

* current-state understanding documented
* target-state documented enough
* decisions identified
* major dependencies visible
* standards impact known

## 10.3 Close gate

Required before closure:

* architecture / process documentation updated
* ADRs finalised
* operating docs updated where relevant
* evidence and outcome captured
* residual risks assigned

---

# 11. Example end-to-end

## Initiative

**Standardise outbound interface error handling**

### Epics

* Current-state assessment
* Target error-handling pattern
* Platform implementation
* Monitoring and operational runbooks
* Rollout across interfaces

### Jira work items

* Assessment: inventory current retry/error patterns
* Decision: choose canonical retry and dead-letter handling model
* Documentation: create reference architecture for async error handling
* Story: implement standard retry behaviour in middleware
* Task: add alerting and dashboard
* Documentation: update support runbook
* Improvement: define support ownership and escalation path

### Confluence pages

* Initiative hub
* Current-state interface handling
* Target-state error-handling architecture
* ADR: canonical retry and dead-letter pattern
* Standard: integration error-handling standard
* Runbook page
* Lessons learned

This produces both delivery outputs and durable architecture knowledge.

---

# 12. Minimal naming conventions

Keep names predictable.

## Jira

### Initiative

`<Outcome verb> <object> <scope>`

* Standardise customer master ownership
* Rationalise terminal pricing interfaces

### Epic

`<Initiative> - <work package>`

* Standardise customer master ownership - Current-state assessment
* Rationalise terminal pricing interfaces - Target-state design

### Decision

`Decision - <subject>`

* Decision - canonical source for customer payment terms

### Documentation

`Document - <artefact>`

* Document - target-state integration landscape

## Confluence

Prefix major pages where helpful:

* `INIT - <name>`
* `ADR - <name>`
* `STD - <name>`
* `PROC - <name>`
* `ARCH - <name>`
* `REV - <name>`

This makes navigation and search materially easier.

---

# 13. Anti-patterns to avoid

## Do not:

* create Jira tickets as substitute meeting minutes
* bury requirements in comments
* close delivery without documentation updates
* create one huge Confluence page per programme
* use subtasks for every minor action
* customise Jira statuses to mirror every human hand-off
* treat ADRs as optional for cross-system decisions
* create project-specific Confluence spaces for short-lived work

---

# 14. Minimal implementation package

If you want a practical starting point, implement only this first.

## Jira

### Issue types

* Initiative
* Epic
* Task
* Story
* Bug
* Assessment
* Decision
* Improvement
* Documentation
* Risk
* Dependency

### Workflows

* one workflow for Initiative/Epic
* one workflow for all other issue types

### Fields

* Outcome statement
* Domain / capability
* Change class
* Affected systems
* Affected process
* Confluence link
* Success metric
* Risk level

## Confluence

### Templates

* Initiative hub
* Current-state assessment
* Target-state design
* ADR
* Standard / reference architecture
* Process design
* Architecture review

That is enough to get discipline without creating a bureaucracy machine.

---

# 15. Recommended rollout sequence

## Phase 1

Stand up:

* issue types
* fields
* templates
* naming conventions

## Phase 2

Introduce:

* Definition of done rules
* initiative and epic review cadence
* basic dashboards / views

## Phase 3

Introduce:

* standards pages
* ADR discipline
* architecture review process
* portfolio reporting on domains, systems, and change classes

Do not start with full governance. Start with traceability and repeatable structure.

---

# 16. Final recommendation

Use this core principle:

* **Initiative and Epic in Jira define what must be achieved**
* **Assessment and Decision items define what must be understood and decided**
* **Confluence pages hold the actual understanding and decisions**
* **Documentation work is explicit, not implied**
* **Closure requires evidence, not just status**

That will work for software delivery, process improvement, and enterprise architecture without forcing them into the same poor abstraction.
