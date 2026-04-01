#!/usr/bin/env bash
SESSION_ID=$(cat - | jq -r '.session_id')
FLAG_DIR="/tmp/claude-code-${SESSION_ID}"
mkdir -p "$FLAG_DIR"
touch "${FLAG_DIR}/pnyx-searched"
