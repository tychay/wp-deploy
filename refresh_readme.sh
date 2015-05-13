#!/bin/bash

BASEDIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
SRC_DIR=${BASEDIR}/git

if [ ! -d "$SRC_DIR/.git" ]; then
	echo "$SRC_DIR doesn't seem to be a git repository"
	exit
fi

pushd $SRC_DIR
	git pull origin master
	wp2md convert <readme.txt >README.md
	git add README.md 
	git commit -m "refresh README markdown"
	git push origin master
popd