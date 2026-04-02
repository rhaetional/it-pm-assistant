## Process model

The cleanest reading is:

**PRJ → RLSE → CHG**

with different control scopes:

* **PRJ**: initiative governance
* **RLSE**: delivery/release orchestration
* **CHG**: operational implementation governance

---

## Lifecycle crosswalk

| Layer               | Record   | Purpose                                               | Lifecycle shown                                                                                                     | Current sample meaning                                            |
| ------------------- | -------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Initiative          | **PRJ**  | Portfolio/project governance                          | **Pipeline → Initiation → Development → Implementation → Closure → Closed**                                         | Work is still in planning/governance horizon                      |
| Delivery            | **RLSE** | Release execution and test/deployment orchestration   | **Draft → Scoping → Awaiting approval → Work in Progress → Testing/QA → Deployment → On Hold → Closed → Cancelled** | Delivery package moving through build, test and go-live readiness |
| Operational control | **CHG**  | Formal implementation approval and production control | **New → Assess → Authorize → Scheduled for Implementation → Implementation → Review → Closed** plus **Cancelled**   | Production implementation event under change control              |

---

## Relationship model

```text
PRJ
  -> owns initiative, priority, planning, portfolio alignment
  -> can be source/parent of RLSE

RLSE
  -> owns release scope, tasks, testing, deployment progression
  -> links to one or more CHG records

CHG
  -> governs implementation approval, scheduling, conflict handling, execution and review
```

### Strongest evidence from the screenshots

* **PRJ** contains initiative and portfolio fields.
* **RLSE** shows **Source of Release = Project** and **Parent / Project Number = PRJ02755**.
* **RLSE** has related lists including **Change Requests (1)**.
* **CHG** shows explicit approval, scheduling and implementation controls.

So the most likely structure is:

**PRJ is above RLSE. RLSE is above, or at least the owning context for, CHG.**

---

## RACI-style process matrix

This is a functional RACI, not a formal organisational RACI. It reflects what the screenshots imply.

| Process area                                | PRJ     | RLSE    | CHG     |
| ------------------------------------------- | ------- | ------- | ------- |
| Work intake / demand capture                | **A/R** | I       | I       |
| Portfolio alignment / prioritisation        | **A/R** | I       | I       |
| Initiative ownership                        | **A/R** | C       | I       |
| Scoping release contents                    | C       | **A/R** | I       |
| Delivery task orchestration                 | I       | **A/R** | I       |
| Development tracking                        | I       | **A/R** | I       |
| Unit / UAT / regression test tracking       | I       | **A/R** | C       |
| Deployment readiness                        | C       | **A/R** | C       |
| Risk and impact assessment for live change  | I       | C       | **A/R** |
| Formal authorisation for implementation     | I       | C       | **A/R** |
| Scheduling implementation window            | I       | C       | **A/R** |
| Conflict detection / calendar control       | I       | I/C     | **A/R** |
| Production implementation execution control | I       | C       | **A/R** |
| Post-implementation review                  | I       | C       | **A/R** |
| Initiative closure                          | **A/R** | C       | I       |
| Release closure                             | I       | **A/R** | C       |
| Change closure                              | I       | I       | **A/R** |

Legend:

* **A** = Accountable
* **R** = Responsible
* **C** = Consulted
* **I** = Informed

---

## Entry and exit criteria by layer

### 1. PRJ

| PRJ phase      | Likely entry condition                   | Likely exit condition / gate                   |
| -------------- | ---------------------------------------- | ---------------------------------------------- |
| Pipeline       | Work identified, not yet fully initiated | Approval to move into initiation               |
| Initiation     | Scope and ownership being formalised     | Sufficient business/technical definition       |
| Development    | Project work approved and underway       | Deliverables ready for implementation planning |
| Implementation | Delivery moving into rollout/adoption    | Implementation complete and stabilised         |
| Closure        | Formal wrap-up underway                  | Closure criteria met                           |
| Closed         | Project fully completed                  | Terminal                                       |

### 2. RLSE

| RLSE stage        | Likely entry condition            | Likely exit condition / gate            |
| ----------------- | --------------------------------- | --------------------------------------- |
| Draft             | Release record created            | Initial definition complete             |
| Scoping           | Release content being defined     | Scope agreed                            |
| Awaiting approval | Release ready for formal approval | Approval granted                        |
| Work in Progress  | Delivery/build underway           | Build complete and testable             |
| Testing/QA        | Test execution in progress        | Testing sign-off or sufficient evidence (Testing Review Task) |
| Deployment        | Ready to launch/deploy            | Deployment complete                     |
| On Hold           | Progress deliberately paused      | Resume decision                         |
| Closed            | Release complete                  | Terminal                                |
| Cancelled         | Release abandoned                 | Terminal                                |

### 3. CHG

| CHG stage                    | Likely entry condition             | Likely exit condition / gate                 |
| ---------------------------- | ---------------------------------- | -------------------------------------------- |
| New                          | Change created                     | Initial completeness achieved                |
| Assess                       | Risk/impact under evaluation       | Assessment complete                          |
| Authorize                    | Awaiting formal approval           | Approval granted                             |
| Scheduled for Implementation | Approved and scheduled             | Execution window reached / manual transition |
| Implementation               | Implementation in progress         | Work completed                               |
| Review                       | Post-implementation validation/PIR | Review accepted                              |
| Closed                       | Change complete                    | Terminal                                     |
| Cancelled                    | Change abandoned                   | Terminal                                     |

---

## Gate model

### PRJ gates

PRJ appears to carry **initiative-level gates**:

* intake / demand acceptance,
* initiation approval,
* movement into implementation,
* closure approval.

Evidence:

* phase-based project lifecycle,
* actions such as **Propose Initiation** and **Propose Cancellation**.

### RLSE gates

RLSE carries **delivery gates**:

* scoping complete,
* approval complete,
* testing complete,
* deployment ready,
* closure.

Evidence:

* dedicated release workflow,
* release task decomposition,
* explicit Testing/QA and Deployment stages.

### CHG gates

CHG carries **operational governance gates**:

* risk/impact assessment,
* formal authorisation,
* schedule control,
* conflict control,
* implementation control,
* post-implementation review.

Evidence:

* assess/authorise/schedule/implement/review lifecycle,
* conflict banner and conflict status,
* manual **Implement** action.

---

## Hand-off model

This is the most useful operational interpretation.

| From | To   | Hand-off meaning                                             |
| ---- | ---- | ------------------------------------------------------------ |
| PRJ  | RLSE | Project work becomes a concrete release package              |
| RLSE | CHG  | Release deployment requires formal production change control |
| CHG  | RLSE | Change outcome feeds back into release completion            |
| RLSE | PRJ  | Release completion supports project implementation/closure   |

---

## State correspondence across layers

These are not exact equivalents, but they are the nearest semantic matches.

| PRJ            | RLSE                        | CHG                                           |
| -------------- | --------------------------- | --------------------------------------------- |
| Pipeline       | Draft / Scoping             | New                                           |
| Initiation     | Scoping / Awaiting approval | Assess / Authorize                            |
| Development    | Work in Progress            | New / Assess / Authorize as needed            |
| Implementation | Testing/QA / Deployment     | Scheduled for Implementation / Implementation |
| Closure        | Closed prep                 | Review                                        |
| Closed         | Closed                      | Closed                                        |

Important nuance: **these are parallel control planes, not one shared state machine**.
So “Implementation” in PRJ is not the same thing as “Implementation” in CHG.

* In **PRJ**, implementation is an initiative phase.
* In **RLSE**, deployment is the release execution phase.
* In **CHG**, implementation is the controlled live change event.

---

## Architectural reading

This ServiceNow design separates three concerns that are often wrongly collapsed:

### 1. Work governance

Handled by **PRJ**.

Questions answered:

* Why are we doing this?
* Who owns it?
* Where does it sit in the portfolio?
* What is the plan?

### 2. Delivery governance

Handled by **RLSE**.

Questions answered:

* What exactly are we releasing?
* Which tasks and test activities make up the release?
* Are we ready to deploy?

### 3. Operational risk governance

Handled by **CHG**.

Questions answered:

* Is this change authorised?
* Is the timing safe?
* Are there conflicts?
* Has implementation and review been completed?

That separation is structurally sound.

---

## Cardinality

What is supported with reasonable confidence:

| Relationship         | Confidence | Reading                                                  |
| -------------------- | ---------- | -------------------------------------------------------- |
| PRJ → RLSE           | High       | 0..n Releases can be sourced from and parented to project      |
| RLSE → Release Tasks | High       | One release has many tasks                               |
| RLSE → CHG           | High       | One release has typically one related change request |

---

## Practical process summary

### PRJ

Owns the initiative from intake to closure.

### RLSE

Owns the release package through scoping, build, testing and deployment.

### CHG

Owns the formal implementation control for the production change event.

So the operating pattern is likely:

```text
A need arises
  -> captured or escalated as INC / PRJ
  -> structured into a project
  -> delivered through one or more releases
  -> each live deployment governed through change requests
```

---

## Concise management summary

| Object   | Executive summary                     |
| -------- | ------------------------------------- |
| **PRJ**  | Governs the initiative                |
| **RLSE** | Governs the delivery package          |
| **CHG**  | Governs the production implementation |

---

## Recommended phrasing for internal documentation

You could describe it like this:

> Projects govern the lifecycle of planned work. Releases govern the execution of a delivery unit derived from a project. Change Requests govern the controlled implementation of that release into production or managed environments.

Or more tersely:

> PRJ decides and governs the work. RLSE organises and verifies the delivery. CHG authorises and controls the live implementation.

I can also turn this into a one-page swimlane diagram or a decision table for “when to use PRJ vs RLSE vs CHG”.
