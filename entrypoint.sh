#!/usr/bin/env bash
set -e

cd $GITHUB_WORKSPACE

detect-secrets-hook --baseline .secrets.baseline $(git ls-files) > output

exit_code=$?

if [ $exit_code -ne 0 ]; then
    echo "Secret Check Failed"
    cat output
    exit 1
fi

exit 0
