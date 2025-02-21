#!/bin/sh

if [ $# -lt 1 ] ; then
  echo "USAGE: $0 <version>"
  exit
fi

name='python'
var=$1

echo "docker build -t langfarm/${name}:${var} ."
docker build -t langfarm/${name}:${var} .
