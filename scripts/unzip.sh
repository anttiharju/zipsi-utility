#!/bin/bash
set -eu

# shellcheck disable=SC2207
files=($(find . -type f -name "*.docx" -o -name "*.xlsx" -o -name "*.pptx"))

calling_path="$(pwd)"
for fullpath in "${files[@]}"											# ./path/to/a.file
do
	dirname="$(dirname "$fullpath")"									# ./path/to
	basename="$(basename -- "$fullpath")"								# a.file
	filename="${basename%%.*}"											# a
	extension="${basename#*.}"											# file
	unzip_folder_path="${dirname}/${filename}_unzipped_${extension}"	# ./path/to/a_unzipped_file
	file_to_unzip="${filename}.tmp"										# a.tmp
	fullpath_to_unzip="${unzip_folder_path}/${file_to_unzip}"			# ./path/to/a_unzipped_file/a.tmp

	mkdir -p "$unzip_folder_path"
	cp "$fullpath" "$fullpath_to_unzip"
	cd "$unzip_folder_path" || exit
	unzip -qo "$file_to_unzip"
	rm "$file_to_unzip"
	cd "$calling_path" || exit
done
