#!/usr/bin/env sh
set -e

cd $GITHUB_WORKSPACE

ls .
cat .secrets.baseline | wc -l

detect-secrets-hook --baseline .secrets.baseline $(git diff --staged --name-only) > output.json

lines=`cat output.json | jq .results | wc -l`
if [ "$lines" -gt 1 ]; then
    echo "Secret Check Failed"
    exit 1
fi
