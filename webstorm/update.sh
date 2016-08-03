#!/bin/bash

NUMBER_OF_FILES=`ls -1 WebStorm-*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES" == "0" ]
then
	echo "There are no WebStorm source packages in this directory."
	echo "Please go to https://www.jetbrains.com/webstorm/download/index.html to download the .tar.gz file and try again."
	exit
fi


if [ "$NUMBER_OF_FILES" != "1" ]
then
	echo "There are multiple WebStorm source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls WebStorm-*.tar.gz | sed -r 's/WebStorm-([0-9\.]+).tar.gz/\1/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION -m "New upstream version" -D stable
