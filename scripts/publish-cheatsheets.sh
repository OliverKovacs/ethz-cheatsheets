#!/bin/env bash

git branch -D cheatsheets

file_list_regex='README.md|*cheatsheet*'   # regex of the files to be included

git checkout -b cheatsheets                     # create new branch from current HEAD

git filter-branch --prune-empty \
  --index-filter "git ls-files -z --cached | grep -z -v -E '$file_list_regex' | xargs -0 -r git rm --cached" \
  -f HEAD

git remote add origin-cs git@github.com:OliverKovacs/ethz-cheatsheets.git

git push -f -u origin-cs cheatsheets

git checkout main
