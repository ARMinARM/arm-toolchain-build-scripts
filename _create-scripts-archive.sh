#!/bin/sh

DATESTRING=`date +%Y-%m-%d`

tar --exclude=*.bz2 --exclude=*.gz --exclude=install\* -cvjf build-scripts-$DATESTRING.tar.bz2 *
