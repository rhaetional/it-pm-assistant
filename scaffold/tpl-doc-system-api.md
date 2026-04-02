# SCAFFOLD: doc/system/API.md

> **Purpose of this template:** Defines the required structure and content standard for `doc/system/API.md`.
> This document specifies the external-facing and internal API contracts of the system.
> It is derived from Architecture.md and must be consistent with component interface definitions.
>
> **Derives from:** `doc/Architecture.md` (must be locked before this document begins)
>
> **Definition of done:**
> - Every interface defined in Architecture.md is documented here.
> - Every endpoint has a request schema, response schema, and error cases.
> - Authentication and authorisation model is fully described.
> - No endpoint is documented without a corresponding operation in Spec.md.
>
> **Skill:** `/system-design`

---

<!-- STATUS: DRAFT | REVIEW | LOCKED — DD.MM.YYYY -->

# API Reference

## Overview

<!--
Brief description of the API surface: what it exposes, to whom, and in what style
(REST, RPC, event-driven, CLI, MCP tools, etc.).
Reference the Architecture.md component(s) this document covers.
-->

---

## Authentication & Authorisation

<!--
Describe the auth model. Be specific:
- What mechanism is used (API key, token, session, OAuth, none)?
- How is identity established per request?
- What authorisation model applies (RBAC, capability-based, none)?
- Are there scoped permissions? If so, list them.
-->

---

## Conventions

<!--
Document-wide conventions:
- Base URL or invocation method
- Request/response format (JSON, plain text, binary, etc.)
- Versioning strategy
- Date/time format
- Error envelope format (define once here, reference below)
- Rate limits or concurrency constraints (reference Spec.md NFR IDs)
-->

### Error Format

<!--
Define the standard error response structure used across all endpoints.

Example:
{
  "error": {
    "code": "string",       // machine-readable
    "message": "string",    // human-readable
    "detail": {}            // optional, operation-specific
  }
}
-->

---

## Endpoints / Operations

<!--
Group by domain (matching Spec.md domains).
One section per endpoint or tool.

### [Domain Name]

#### [Operation / Endpoint Name]

- **Method / Invocation:** [HTTP method + path] or [tool name + signature]
- **Description:** What this does. Reference the Spec.md operation it implements.
- **Request:**
  ```
  {
    "field": "type — description"
  }
  ```
- **Response:**
  ```
  {
    "field": "type — description"
  }
  ```
- **Error cases:**
  | Code | Condition |
  |---|---|
  | | |
- **Notes:** Edge cases, deprecated fields, or constraints.
-->

### Domain: [Name]

#### [Operation Name]

- **Method / Invocation:**
- **Description:**
- **Request:**
- **Response:**
- **Error cases:**
- **Notes:**

---

## Open Questions

<!--
| # | Question | Owner | Target | Status |
|---|---|---|---|---|
| OQ-001 | | | | OPEN |
-->
