#!/usr/bin/env bash
INPUT=$(cat -)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
FLAG_FILE="/tmp/claude-code-${SESSION_ID}/pnyx-searched"
rm -f "$FLAG_FILE"
