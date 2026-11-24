# Global defaults

Project instructions override these.

## Working mode
- When you ask, group the questions. Give your best guess and what each answer changes.
- For a minor ambiguity, pick the most conservative option and state it.
- For an "every X" or "combine A and B" request, list all targets first. Then edit each target on the list.
- When I name a source of truth, it wins in every conflict, including rebase conflicts.
- In a prose edit, change only the prose. Keep code blocks, links, and headings as they are.
- When I ask a question or ask for an explanation, the deliverable is the answer in chat. Edit files when I ask for a change.
- For UI, UX, or document structure, propose 2 or 3 options (screenshots for UI) and build the one I pick.
- Before you design a system or configure a tool, read how established tools solve it and the current official docs. Follow their conventions, and keep only the config that applies.

## Ask first
Ask before these, unless the task or spec already decides them:
- Auth, security, or permissions.
- Schema or migration.
- Public API.
- Architecture, a new library, or a new dependency. Show 2-3 options with tradeoffs and a recommendation, and say why the stdlib or an installed dependency is not enough.
- Deletion or replacement of a large block of code.

## Code
- Replace old code fully, with no shims, dual configs, or migration paths. Code and docs describe the current state, not a changelog.
- Delete the orphans your change makes. Flag pre-existing dead code, and delete it only when I ask.
- Limits: ≤100 lines per function, cyclomatic complexity ≤8, ≤5 positional parameters.
- In the shell, search with `rg` and list files with `rg --files`, even where a skill shows `grep` or `find`.
- Delete files with `trash <file>`, so every deletion is recoverable.
- Let names and structure carry the meaning. Write a comment only for what the code cannot say, in one line that stays true as the code changes.

## Git
- With `ship`, follow its process for commits, pushes, reviews, and restacks. Without `ship`, I run git myself: end with the changes in the worktree and say what is ready to commit.
- Start branches, worktrees, investigations, and pushes from a freshly fetched `origin/main`. Resolve rebase conflicts yourself.
- Work in one worktree per task, with absolute paths. Before you open a second one, say why. Use only the servers and databases you started, and stop them by PID.
- Give each logical change its own commit: unrelated cleanup in its own commit, another repo in its own PR, a follow-up fix in a new PR on top.

## Debugging and verification
- A cause is a hypothesis, and labelled as one, until a log, a reproduction, or the code proves it. A proven cause explains why X fails and a similar Y does not.
- Do the cheap checks first: is the service up, and which worktree or dev server is running?
- Give the source of each number or factual claim (file, query, log, or link), and label inferences. Verify subagent and reviewer output before you rely on it.
- Fix a bug test-first: write a test that fails without the fix. Then check sibling code paths for the same class of bug.

## Writing
- Use the text `commit-message` and `pr-description` write, unchanged.
- `docs-writer` assumes gemini-cli: map its `packages/`, `docs/sidebar.json`, and `npm run format` steps to the current project, or skip them.
- Punctuate with commas, colons, parentheses, or periods. Never write an em dash (—), an en dash (–), or `--` as a dash, in replies, files, commit messages, or subagent prompts.

## Review
- Cross-provider reviewer (`ship`, or `pr-review` by delegation): Codex `gpt-6.2-sol` with `reasoningEffort: high`.

## Codebase feedback
- Flag surprising or inconsistent code: state what you expected and what you found.
- When I correct the same thing twice, propose a rule for the project AGENTS.md.
