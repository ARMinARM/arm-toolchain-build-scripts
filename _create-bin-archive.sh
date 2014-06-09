#!/bin/sh

DATESTRING=`date +%Y-%m-%d`

cd install
tar -czf ../arm-toolchain-bin-$DATESTRING.tar.gz *
cd ..
