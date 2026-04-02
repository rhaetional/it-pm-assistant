Atlassian provides two Python libraries, but neither is worth using as a foundation for serious tooling.

**`atlassian-python-api`** (the main one)
- Community-maintained, not officially supported by Atlassian
- Coverage is inconsistent — some endpoints are wrapped, others aren't, and the wrappers often lag behind API changes
- Abstracts away things you'll want control over (pagination strategy, error handling, retry logic)
- Confluence v2 API and Jira's newer endpoints are poorly covered

**`jira` (PyPI)**
- Official-ish but similarly thin and patchy
- Mainly covers Jira; no Confluence

**My recommendation: raw `httpx` (or `requests`) with a thin wrapper you own**

For a tool that integrates Confluence *and* Jira with any degree of seriousness, the libraries buy you very little and cost you:
- Debugging through an abstraction layer when something breaks
- Waiting for library updates when Atlassian changes an endpoint
- Loss of fine-grained control over pagination, rate limiting, and retry behaviour

What you *do* want to centralise:
- Auth (PAT or OAuth2, injected once)
- Pagination handling (Confluence uses `start`/`limit`; Jira uses `startAt`/`maxResults` — both need cursor management)
- Rate limit handling (429 with `Retry-After`)
- A typed response model layer (Pydantic works well here)

A thin client class per product (~100–150 lines each) gives you full control, is easy to test, and has no dependency drift risk. Given your SQLite-cache + MCP architecture, you'll also want to keep the HTTP layer clean so you can mock it easily in tests.

The one exception: if you only need a handful of simple read operations and time-to-working-code matters more than robustness, `atlassian-python-api` gets you there faster. But for the initiative management tool you're designing, I'd skip it.