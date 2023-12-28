#!/bin/bash
set -eu

unzipped_tag="_unzipped_"

# shellcheck disable=SC2207
files=($(find . -type f -not -path "*${unzipped_tag}*" -name "*.docx" -o -name "*.xlsx" -o -name "*.pptx"))

calling_path="$(pwd)"
for fullpath in "${files[@]}"												# ./path/to/a.file
do
	dirname="$(dirname "$fullpath")"										# ./path/to
	basename="$(basename -- "$fullpath")"									# a.file
	filename="${basename%%.*}"												# a
	extension="${basename#*.}"												# file
	unzip_folder_path="${dirname}/${filename}${unzipped_tag}${extension}"	# ./path/to/a_unzipped_file

	mkdir -p "$unzip_folder_path" && cp "$fullpath" "$unzip_folder_path"
	cd "$unzip_folder_path" || exit
	unzip -qo "$basename" && rm "$basename"
	cd "$calling_path" || exit
done


# Increase diff readability by inserting newlines between <tags>
# MS Office documents have a tendency to have all tags on the same line

# shellcheck disable=SC2207
files_to_insert_newlines_to=($(find . -type f -path "*${unzipped_tag}*"))

for file in "${files_to_insert_newlines_to[@]}"
do
	# sed doesn't play nice with some filenames such as "[Content_Types].xml"
	perl -i -p -e 's/></>\n</g' "$file"
done