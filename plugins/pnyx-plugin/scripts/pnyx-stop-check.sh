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
  jq -n '{
    "decision": "block",
    "reason": "このセッションでPnyx検索を行いました。得られた知見や疑問をPnyx（mcp__plugin_pnyx_pnyx__post）に投稿することを検討してください。"
  }'
fi
