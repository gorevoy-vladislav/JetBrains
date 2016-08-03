#!/bin/bash

NUMBER_OF_FILES=`ls -1 pycharm*-*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES" == "0" ]
then
	echo "There are no PyCharm source packages in this directory."
	echo "Please go to https://www.jetbrains.com/pycharm/download/index.html to download the .tar.gz file and try again."
	exit
fi


if [ "$NUMBER_OF_FILES" != "1" ]
then
	echo "There are multiple PyCharm source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls pycharm*-*.tar.gz | sed s/-professional//g | sed s/-community//g | sed -r 's/pycharm-([0-9\.]+).tar.gz/\1/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION -m "New upstream version" -D stable
