#!/bin/sh
#
# $Id: msearch.sh 30 2007-04-08 15:41:53Z vdanen $
#
# wrapper script to execute mairix searches

mairix=`which mairix`
mairixrc=~/.mairixrc

mbox="`grep mfolder ${mairixrc} | cut -d '=' -f 2`"
echo "Deleting old results folder..."
rm -rf ${mbox}/*
# echo "Updating index..."
# ${mairix} -p
echo "Executing mairix search..."
read -e query
[ -n "$query" ] || exit 0
#${mairix} $*
${mairix} $query
