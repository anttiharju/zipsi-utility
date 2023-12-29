#!/bin/bash
set -eu

# shellcheck disable=SC2207
files=($(find . -type d \
	-ipath "*${UNZIPPED}docx" -or \
	-ipath "*${UNZIPPED}xlsx" -or \
	-ipath "*${UNZIPPED}pptx" ))

if [ -z "${files:-}" ]
then
	echo "Error: no directories containing unzipped docx, xslx, or pptx files under current directory."
	exit 1
fi

calling_path="$(pwd)"
for fullpath in "${files[@]}"
do
	basename="$(basename -- "$fullpath")"
	filename="${basename%%"${UNZIPPED}"*}"
	extension="${basename#*"${UNZIPPED}"}"
	new_filename="${filename}${ZIPPED}.${extension}"

	cd "$fullpath" || exit 2 # shouldn't be possible to fail
	zip -qr "../${new_filename}" -- *
	cd "$calling_path" || exit 3 # shouldn't be possible to fail
done
