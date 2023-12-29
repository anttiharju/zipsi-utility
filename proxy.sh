#!/bin/bash
set -eu

UNZIPPED="_unzipped_"
ZIPPED="_zipped"

case $1 in
	init)
		git init
		# remove the install path assumption
		cp -r ~/zipsi-utility/init/ $CALLER_PATH
	;;
	save)
		UNZIPPED=$UNZIPPED ZIPPED=$ZIPPED ~/zipsi-utility/scripts/unzip.sh
		~/zipsi-utility/scripts/save.sh
	;;
	restore)
		# later could be combined with grep and a special restore directory across commit history with interactivity
		UNZIPPED=$UNZIPPED ZIPPED=$ZIPPED ~/zipsi-utility/scripts/zip.sh
	;;
	version)
		echo "1.1 (macOS, not battle-tested)"
	;;
	unzip)
		# mainly for testing purposes
		UNZIPPED=$UNZIPPED ZIPPED=$ZIPPED ~/zipsi-utility/scripts/unzip.sh
	;;
	*)
		echo "Error: unrecognized command \"$1\""
		exit 4
esac
