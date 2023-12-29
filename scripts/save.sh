#!/bin/bash
set -eu

username=$(git config user.name)
current_directory=${PWD##*/}
current_directory=${current_directory:-/}

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
open "https://github.com/${username}/${current_directory}"
