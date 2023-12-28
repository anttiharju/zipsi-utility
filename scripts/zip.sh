#!/bin/bash

unzipped_tag="_unzipped_"
zipped_tag="_zipped"

# shellcheck disable=SC2207
files=($(find . -type d \
	-path "*${unzipped_tag}docx" -or \
	-path "*${unzipped_tag}xlsx" -or \
	-path "*${unzipped_tag}pptx" \
	))

calling_path="$(pwd)"
for fullpath in "${files[@]}"
do
	basename="$(basename -- "$fullpath")"
	filename="${basename%%"${unzipped_tag}"*}"
	extension="${basename#*"${unzipped_tag}"}"
	new_filename="${filename}${zipped_tag}.${extension}"

	cd "$fullpath" || exit
	zip -qr "../${new_filename}" -- *
	cd "$calling_path" || exit
done
