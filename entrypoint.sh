#!/usr/bin/env sh
set -e

cd $GITHUB_WORKSPACE

detect-secrets-hook --baseline .secrets.baseline > output.json

lines=`cat output.json | jq .results | wc -l`

if [ "$lines" -gt 1 ]; then
    echo "Secret Check Failed with $lines new secrets found"
    cat output.json
    exit 1
fi
