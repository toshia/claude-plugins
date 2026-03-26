#!/bin/bash
# Pnyx: git commit 後に pnyx-contribute エージェントの起動を促すコンテキストを注入する
input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // ""' 2>/dev/null)

if echo "$command" | grep -qE 'git (commit|merge)'; then
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"git commit が完了した。pnyx-contribute エージェントを起動し、このコミットの技術的な知見を Pnyx に投稿できるか確認すること。"}}'
fi
