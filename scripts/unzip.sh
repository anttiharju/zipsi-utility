#!/bin/bash
set -eu

unzipped_tag="_unzipped_"
zipped_tag="_zipped"

# shellcheck disable=SC2207
files=($(find . -type f \
	-not -path "*${unzipped_tag}*" \
	-not -path "*${zipped_tag}.*" \
	-name "*.docx" -o \
	-name "*.xlsx" -o \
	-name "*.pptx" \
	))

calling_path="$(pwd)"
for fullpath in "${files[@]}"												# ./path/to/file.extension
do
	dirname="$(dirname "$fullpath")"										# ./path/to
	basename="$(basename -- "$fullpath")"									# file.extension
	filename="${basename%%.*}"												# file
	extension="${basename#*.}"												# extension
	unzip_folder_path="${dirname}/${filename}${unzipped_tag}${extension}"	# ./path/to/file_unzipped_extension (folder)

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
