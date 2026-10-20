#!/usr/bin/env bash
# PreToolUse(Bash): drop Co-Authored-By trailers from git commit commands, then pass the result to the hook command given as arguments.
set -uo pipefail

input=$(cat)

stripped=$(jq -c '
  .tool_input.command |= (
    if type == "string" and test("\\bgit\\b[^\\n]*\\bcommit\\b") then
      gsub("[ \\t]*-m[ \\t]+(?<q>[\"\u0027])Co-Authored-By:[^\"\u0027]*\\k<q>"; ""; "i")
      | gsub("\\n[ \\t]*Co-Authored-By:[^\\n\"\u0027]*"; ""; "i")
    else . end
  )' <<<"$input") || stripped=$input

next_out=$("$@" <<<"$stripped")
next_status=$?

if [[ -n $next_out || $next_status -ne 0 ]]; then
  printf '%s\n' "$next_out"
  exit "$next_status"
fi

if [[ $(jq -r '.tool_input.command' <<<"$stripped") != $(jq -r '.tool_input.command' <<<"$input") ]]; then
  # Codex rejects updatedInput without permissionDecision "allow" (a rewrite marker, not an approval).
  # In Claude, "allow" would skip the permission prompt, so it is set only for HOOK_AGENT=codex.
  jq -c --arg agent "${HOOK_AGENT:-claude}" '{hookSpecificOutput: ({
    hookEventName: "PreToolUse",
    permissionDecisionReason: "Stripped Co-Authored-By trailer",
    updatedInput: .tool_input
  } + (if $agent == "codex" then {permissionDecision: "allow"} else {} end))}' <<<"$stripped"
fi
