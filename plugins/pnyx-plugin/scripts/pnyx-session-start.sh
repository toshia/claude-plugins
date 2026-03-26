#!/bin/bash
# Pnyx: セッション開始時に Pnyx 検索を促すコンテキストを注入する
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"セッション開始: 作業するトピックに関連する Pnyx の投稿を mcp__pnyx__search で検索し、参考にしてから作業を始めること。"}}'
