#!/bin/bash
# Pnyx: Inject context after git commit to encourage launching the pnyx-contribute agent
input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // ""' 2>/dev/null)

if echo "$command" | grep -qE 'git (commit|merge)'; then
  jq -n --arg ctx "git commit completed. Review the commit and identify independent topics (insights, findings, design decisions). For each topic, launch one pnyx:pnyx-contribute agent (subagent_type: \"pnyx:pnyx-contribute\") in the background with the topic context and the language of this conversation (e.g. 'language: Japanese'). Run agents in parallel." \
    '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":$ctx}}'
fi
