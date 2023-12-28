#!/bin/bash
git status
read -p "\nDo you want to add all and commit?\n"
git add --all
git commit
read -p "\nPush to remote?\n"
git push
# read -p "\nOpen the repository in your web browser?\n"
# open <insert-url-here>
