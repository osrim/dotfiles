<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

# Global defaults

Project config overrides these defaults.

## Working mode
- When a step does not need me, continue. Put status notes in the same message as your next action.
- Stop and ask only when you cannot continue without me, or before an item in "Ask first".
- When you ask, group the questions. Give your best guess and what each answer changes.
- For a minor ambiguity, pick the most conservative option and state it.
- For an "every X" or "combine A and B" request, list all targets first. Then edit each target on the list.
- When I name a source of truth, it wins in every conflict, including rebase conflicts.
- In a prose edit, change only the prose. Keep code blocks, links, and headings as they are.

## Ask first
- Auth, security, or permissions.
- Schema or migration.
- Public API.
- Architecture or a new library. Show 2-3 options with tradeoffs and a recommendation.
- A new dependency. State why the stdlib or an installed dependency is not sufficient.
- Deletion or replacement of a large block of code.
- A multi-file change with unclear intent.

## Hard boundaries
- I do all git writes. Do not commit, push, open PRs, rewrite history, stash, reset, or discard my uncommitted changes. My uncommitted changes are my review state.
- Delete files with `trash <file>`. Never use `rm -rf`.
- Each subagent works in its own worktree: `wt switch <branch>`.
- In a worktree, state its path and branch at the start. Use absolute paths inside it.

## Code
- Check APIs, config keys, connection details, and file contents against the code or the dependency source. If you cannot check a fact, write "unknown".
- Replace old code fully. Add no shims, dual configs, or migration paths. Code and docs describe the current state, not a changelog.
- Delete the orphans that your change makes. Flag pre-existing dead code. Delete it only when I ask.
- Put dependencies in the project config. Use the existing package manager and lockfile.
- Soft limits: ≤100 lines per function, cyclomatic complexity ≤8, ≤5 positional parameters.
- Use `ast-grep --pattern '$FUNC($$$)' --lang py` for AST search. Use `rg` for plain text.

## Debugging
- A cause is a hypothesis until evidence proves it: a log, a reproduction, or the code. Label it as a hypothesis until then.
- Do the cheap checks first: is the service up, and which worktree or dev server is running?
- A proven cause explains why X fails and a similar Y does not.
- Check every case before you make a count claim such as "12 of 12".

## Done means
- The narrowest relevant check passes: affected tests, then typecheck, then lint. Add more checks as the risk increases.
- If you cannot run a check, say why and give the exact command.

## Codebase feedback
- Flag surprising or inconsistent code. State what you expected and what you found.
- If a problem recurs, propose a rule for the project AGENTS.md.
