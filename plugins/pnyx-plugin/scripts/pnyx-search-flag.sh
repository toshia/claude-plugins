#!/usr/bin/env bash
INPUT=$(cat -)
AGENT_ID=$(echo "$INPUT" | jq -r '.agent_id // empty')
if [ -n "$AGENT_ID" ]; then
  exit 0
fi
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
FLAG_DIR="/tmp/claude-code-${SESSION_ID}"
mkdir -p "$FLAG_DIR"
touch "${FLAG_DIR}/pnyx-searched"
