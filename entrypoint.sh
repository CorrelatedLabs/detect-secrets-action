#!/usr/bin/env sh
set -e

cd $GITHUB_WORKSPACE

ls .
cat .secrets.baseline | wc -l
detect-secrets-hook --version
detect-secrets --version

detect-secrets-hook --baseline .secrets.baseline $(git diff --staged --name-only) > output.json

lines=`cat output.json | jq .results | wc -l`
echo $lines

if [ "$lines" -gt 1 ]; then
    echo "Secret Check Failed with $lines new secrets found"
    cat output.json
    exit 1
fi
