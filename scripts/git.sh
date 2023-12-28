#!/bin/bash
set -eu

git status
printf "\nPress any key to add all and commit.\n"
read -r
git add --all
git commit
printf "\nPress any key to push to remote.\n"
read -r
git push
printf "\nPress any key to open the repository in your web browser.\n"
read -r
open https://github.com/
