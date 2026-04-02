# Confluence Space: IT Architecture

We have one space for use right now - `IT Architecture`. The Architecture or Project work represent top-level pages
whose documents are "indexed" with page properties.

## Architecture 
### Variant 1
```
Enterprise Architecture (EA)
  ├── Principles & Standards
  ├── Architecture Decisions (ADR Index)
  │     └── ADR-NNN: [title]
  ├── Domain Architecture
  │     ├── Application
  │     ├── Data
  │     ├── Integration
  │     └── Infrastructure
  ├── Current State (As-Is)
  ├── Target State (To-Be)
  └── Transition Roadmap
```

### Variant 2
```
Enterprise Architecture (EA)
├── Integration Architecture
├── Data & Analytics
├── Security Architecture
├── Platform & Infrastructure
└── Decisions (cross-cutting ADR index)
```

## Process Improvement (?)
```
Process & Improvement (PROC)
  ├── Process Inventory
  ├── Process Maps (by domain)
  └── Improvement Register
```

## Project Work
```
Project Working Spaces (per initiative)
  ├── [Initiative Name]
  │     ├── Brief & Scope
  │     ├── Design Documents          ← feeds SNOW design doc review gate
  │     ├── Decision Log
  │     ├── Meeting Notes
  │     └── Post-Implementation Review ← populated after SNOW post-impl review
  ```