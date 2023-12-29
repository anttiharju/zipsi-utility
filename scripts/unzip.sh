#!/bin/bash
set -eu

UNZIPPED="_unzipped_"
ZIPPED="_zipped"

# shellcheck disable=SC2207
files=($(find . -type f \
	-not -ipath "*${ZIPPED}.*" \
	-iname "*.docx" -or \
	-not -ipath "*${ZIPPED}.*" \
	-iname "*.xlsx" -or \
	-not -ipath "*${ZIPPED}.*" \
	-iname "*.pptx" ))

calling_path="$(pwd)"
for path in "${files[@]}"										# ./path/to/file.extension
do
	dirname="$(dirname "$path")"								# ./path/to
	basename="$(basename -- "$path")"							# file.extension
	filename="${basename%%.*}"									# file
	extension="${basename#*.}"									# extension
	unzip_path="${dirname}/${filename}${UNZIPPED}${extension}"	# ./path/to/file_unzipped_extension (folder)

	mkdir -p "$unzip_path" && cp "$path" "$unzip_path"
	cd "$unzip_path" || exit
	unzip -qo "$basename" && rm "$basename"
	cd "$calling_path" || exit
done

# Increase diff readability by inserting newlines between <tags>
# MS Office documents have a tendency to have all tags on the same line

# shellcheck disable=SC2207
files_to_insert_newlines_to=($(find . -type f \
	-ipath "*${UNZIPPED}*" \
	-iname "*.xml" -or \
	-ipath "*${UNZIPPED}*" \
	-iname "*.rels" ))
# ^ it's not safe to add newlines to other file types (such as .png)

for file in "${files_to_insert_newlines_to[@]}"
do
	# using perl because can't figure out a way to make sed not interpret parts of the string literal
	perl -i -p -e 's/></>\n</g' "$file"
done
