#!/bin/bash
set -eu

UNZIPPED="_unzipped_"
ZIPPED="_zipped"

# shellcheck disable=SC2207
files=($(find . -type d \
	-ipath "*${UNZIPPED}docx" -or \
	-ipath "*${UNZIPPED}xlsx" -or \
	-ipath "*${UNZIPPED}pptx" ))

calling_path="$(pwd)"
for fullpath in "${files[@]}"
do
	basename="$(basename -- "$fullpath")"
	filename="${basename%%"${UNZIPPED}"*}"
	extension="${basename#*"${UNZIPPED}"}"
	new_filename="${filename}${ZIPPED}.${extension}"

	cd "$fullpath" || exit
	zip -qr "../${new_filename}" -- *
	cd "$calling_path" || exit
done
