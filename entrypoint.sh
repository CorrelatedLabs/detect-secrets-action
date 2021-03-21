#!/usr/bin/env sh
set -e

cd $GITHUB_WORKSPACE

detect-secrets-hook --baseline .secrets.baseline $(git ls-files) > output

lines=`cat output.json | wc -l`

if [ "$lines" -gt 1 ]; then
    echo "Secret Check Failed"
    cat output
    exit 1
fi
