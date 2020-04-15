#!/usr/bin/env sh
set -e
output=$(detect-secrets scan)
echo "::set-output name=output::$output"
lines=echo $output | jq .results | wc -l
if [ "$lines" -gt 1 ]; then
    exit -1
fi
