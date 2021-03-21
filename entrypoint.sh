#!/usr/bin/env sh
set -e

detect-secrets-hook --baseline .secrets.baseline $(git diff --staged --name-only) > output.json

lines=`cat output.json | jq .results | wc -l`
if [ "$lines" -gt 1 ]; then
    echo "Secret Check Failed"
    exit 1
fi
