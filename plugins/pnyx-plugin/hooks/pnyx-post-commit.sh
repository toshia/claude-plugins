#!/bin/bash
# Pnyx: Inject context after git commit to encourage launching the pnyx-contribute agent
input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // ""' 2>/dev/null)

if echo "$command" | grep -qE 'git (commit|merge)'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"git commit completed. Launch the pnyx-contribute agent and check whether the technical insights from this commit are worth posting to Pnyx."}}'
fi
