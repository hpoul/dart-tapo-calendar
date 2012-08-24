#!/bin/sh

DART_SDK=/Volumes/mydata/downloads/dart/dart-sdk
LESSC=lessc

if test -f _config.sh ; then
    source _config.sh
fi

DART2JS=$DART_SDK/bin/dart2js
BASEDIR=`dirname $0`/..
OUTDIR=`dirname $0`/out

if test -d $OUTDIR ; then
  rm -rf $OUTDIR
fi

mkdir -p $OUTDIR


$DART2JS -o$OUTDIR/CalendarExample.dart.js $BASEDIR/samples/CalendarExample.dart
$LESSC $BASEDIR/lib/tapo_calendar.less $OUTDIR/tapo_calendar.less.css

cat $BASEDIR/samples/example.html  | sed "s/DEV START-->/DEV START/" | sed "s/<.--DEV END/DEV END/" | sed "s/BUILD START/BUILD START-->/" | sed "s/BUILD END/<\!--BUILD END/" > $OUTDIR/example.html

rm -rf $BASEDIR/page
mkdir -p $BASEDIR/page
cp -r $OUTDIR/* $BASEDIR/page

