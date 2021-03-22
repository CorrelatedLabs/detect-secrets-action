#!/usr/bin/env bash

cd $GITHUB_WORKSPACE

echo "Running detect-secrets-hook to check for new secrets"
detect-secrets-hook --baseline .secrets.baseline $(git ls-files) > output
error_code=$?

if [ $error_code -ne 0 ]
then
  echo "Detected potential secrets"
  cat output
  exit 1
else
  echo "No secrets detected"
  exit 0
fi
