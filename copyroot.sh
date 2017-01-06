#!/bin/sh
#
# script to update local root director in each
# build tag as you can't link above build root
# from lastest
#
# (c) 2017 nimmis <kjell.havneskold@gmail.com>
#

BASEDIR=$(dirname "$0")

if [ -d $BASEDIR/12.04/root ]; then
  rm -Rf $BASEDIR/12.04/root
fi

if [ -d $BASEDIR/14.04/root ]; then
  rm -Rf $BASEDIR/14.04/root
fi

if [ -d $BASEDIR/16.04/root ]; then
  rm -Rf $BASEDIR/16.04/root
fi

cp -Rp $BASEDIR/root $BASEDIR/12.04/
cp -Rp $BASEDIR/root $BASEDIR/14.04/
cp -Rp $BASEDIR/root $BASEDIR/16.04/

