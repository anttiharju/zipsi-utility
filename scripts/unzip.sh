#!/bin/bash

# macOS bash is old (3.2) -> can't satisfy shellcheck.net
files=($(find . -type f -name "*.docx" -o -name "*.xlsx" -o -name "*.pptx"))

for file in "${files[@]}"
do
	echo "$file"
	echo potato # to see we actually have distinct values in the array
done
