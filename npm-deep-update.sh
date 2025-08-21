#!/bin/bash

set -e

for dep in $(test -e cache.txt && cat cache.txt || npm outdated --all --json | jq -r 'keys[]' | tr -d "\r" | tee cache.txt); do
  echo "$dep";
  npm update --no-audit --no-fund --no-update-notifier "$dep"
  if git status --porcelain package-lock.json | grep -q ' M '; then
    git add package-lock.json
    git commit --no-verify -m "chore(deps): update $dep"
  fi
  sed -i '1d' cache.txt
done

rm -f cache.txt
