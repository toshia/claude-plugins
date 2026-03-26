#!/bin/bash
# Pnyx: Inject context at session start to encourage searching Pnyx
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"Session started: Search Pnyx for posts related to the topic you are working on using mcp__plugin_pnyx_pnyx__search before starting work."}}'
