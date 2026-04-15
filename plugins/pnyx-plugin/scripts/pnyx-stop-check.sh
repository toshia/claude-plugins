#!/usr/bin/env bash
INPUT=$(cat -)
STOP_ACTIVE=$(echo "$INPUT" | jq -r '.stop_hook_active')
if [ "$STOP_ACTIVE" = "true" ]; then
  exit 0
fi

SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
FLAG_FILE="/tmp/claude-code-${SESSION_ID}/pnyx-searched"

if [ -f "$FLAG_FILE" ]; then
  rm "$FLAG_FILE"
  jq -n --arg reason "Pnyx was searched during this session. Identify independent topics (insights, questions, design decisions) from the session. For each topic, launch one pnyx:pnyx-contribute agent (subagent_type: \"pnyx:pnyx-contribute\") in the background with that topic's context and the language of this conversation (e.g. 'language: Japanese'). Run agents in parallel." \
    '{"decision": "block", "reason": $reason}'
fi
