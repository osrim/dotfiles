# Global defaults

Project instructions override these.

## Working mode
- When you ask, group the questions. Give your best guess and what each answer changes.
- For a minor ambiguity, pick the most conservative option and state it.
- For an "every X" or "combine A and B" request, list all targets first. Then edit each target on the list.
- When I name a source of truth, it wins in every conflict, including rebase conflicts.
- In a prose edit, change only the prose. Keep code blocks, links, and headings as they are.

## Ask first
Ask before these, unless the task or spec already decides them:
- Auth, security, or permissions.
- Schema or migration.
- Public API.
- Architecture, a new library, or a new dependency. Show 2-3 options with tradeoffs and a recommendation, and say why the stdlib or an installed dependency is not enough.
- Deletion or replacement of a large block of code.
- A multi-file change with unclear intent.

## Code
- Replace old code fully, with no shims, dual configs, or migration paths. Code and docs describe the current state, not a changelog.
- Delete the orphans your change makes. Flag pre-existing dead code, and delete it only when I ask.
- Soft limits: ≤100 lines per function, cyclomatic complexity ≤8, ≤5 positional parameters.
- In the shell, search with `rg` and list files with `rg --files`, even where a skill shows `grep` or `find`.
- Delete files with `trash <file>`, so every deletion is recoverable.

## Debugging
- A cause is a hypothesis, and labelled as one, until a log, a reproduction, or the code proves it. A proven cause explains why X fails and a similar Y does not.
- Do the cheap checks first: is the service up, and which worktree or dev server is running?

## Writing
- Before `git commit`, use the `commit-message` skill. Before `gh pr create` or `gh pr edit --body`, use the `pr-description` skill. Use the text each skill writes.
- For documentation (READMEs, `docs/`, guides), use the `docs-writer` skill. Map its gemini-cli steps (`packages/`, `docs/sidebar.json`, `npm run format`) to the current project, or skip them.
- Punctuate with commas, colons, parentheses, or periods. Never write an em dash (—), an en dash (–), or `--` as a dash, in replies, files, commit messages, or subagent prompts.

## Codebase feedback
- Flag surprising or inconsistent code: state what you expected and what you found.
- If a problem recurs, propose a rule for the project AGENTS.md.
