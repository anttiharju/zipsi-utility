#!/bin/bash
set -eu

case $1 in
	init)
		git init
		# remove the install path assumption
		cp -r ~/zipsi-utility/init/ $CALLER_PATH
	;;
	save)
		./scripts/unzip.sh
		./scripts/save.sh
	;;
	restore)
		# later could be combined with grep and a special restore directory across commit history with interactivity
		./scripts/zip.sh
	;;
	version)
		echo "1.1 (macOS, not battle-tested)"
	;;
	*)
		echo "Error: unrecognized command \"$1\""
		exit 4
esac