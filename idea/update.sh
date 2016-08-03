#!/bin/bash

NUMBER_OF_FILES=`ls -1 ideaI*-*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES" == "0" ]
then
	echo "There are no IDEA source packages in this directory."
	echo "Please go to https://www.jetbrains.com/idea/download/index.html to download the .tar.gz file and try again."
	exit
fi


if [ "$NUMBER_OF_FILES" != "1" ]
then
	echo "There are multiple IDEA source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls ideaI*-*.tar.gz | sed s/IU//g | sed s/IC//g | sed -r 's/idea-([0-9\.]+).tar.gz/\1/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION -m "New upstream version" -D stable
