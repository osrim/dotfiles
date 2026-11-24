---
name: ctx7
description: Fetch current docs with the ctx7 CLI whenever the user asks about a library, framework, SDK, API, CLI tool, or cloud service (API syntax, configuration, version migration, setup, library-specific debugging), even a well-known one and even when you think you know the answer. Prefer it over web search for library docs. Skip it for refactoring, scripts from scratch, business-logic debugging, code review, and general programming concepts.
---

# ctx7

1. Resolve the library: `npx ctx7@latest library <name> "<what to look up>"`. Use the official name with its punctuation ("Next.js", "Customer.io"). Skip this step when the user gives an ID in `/org/project` format.
2. Pick the best match by exact name, description relevance, snippet count, source reputation (High or Medium), and benchmark score. If nothing fits, retry with another name or query. For a version, use `/org/project/version` from the output.
3. Fetch: `npx ctx7@latest docs <libraryId> "<what to look up>"`. Write one specific query per concept, and combine concepts only to ask how they interact.

Run 3 commands at most per question.

On a quota error, tell the user to run `npx ctx7@latest login` or set `CONTEXT7_API_KEY`, and say the answer comes from training data.
