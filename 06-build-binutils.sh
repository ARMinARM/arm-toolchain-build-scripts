#!/bin/sh

# 
# YAGARTO toolchain                                                       
#                                                                            
# Copyright (C) 2006-2012 by Michael Fischer                                      
# Michael.Fischer@yagarto.de                                                 
#                                                                            
# This program is free software; you can redistribute it and/or modify       
# it under the terms of the GNU General Public License as published by       
# the Free Software Foundation; either version 2 of the License, or          
# (at your option) any later version.                                        
#                                                                            
# This program is distributed in the hope that it will be useful,            
# but WITHOUT ANY WARRANTY; without even the implied warranty of             
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              
# GNU General Public License for more details.                               
#                                                                            
# You should have received a copy of the GNU General Public License          
# along with this program; if not, write to the Free Software                
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
# 

#---------------------------------------------------------------------------------
# build and install binutils
#---------------------------------------------------------------------------------

echo "Start of build:" > 06-temp.txt
date >> 06-temp.txt 

mkdir -p binutils-build
cd binutils-build

if [ "$OSTYPE" = "msys" ]
then
export CFLAGS=-D__USE_MINGW_ACCESS
fi

CFLAGS="-I$addon_tools_dir/include" \
LDFLAGS="-L$addon_tools_dir/lib" \
../$BINUTILS_SRC/configure \
	--target=$target \
	--prefix=$prefix \
	--disable-shared \
	--disable-nls \
	--disable-threads \
	--enable-interwork \
	--enable-multilib \
	--with-gcc \
	--with-gnu-as \
	--with-gnu-ld \
	|| { echo "Error configuring binutils"; exit 1; }

$MAKE || { echo "Error building binutils"; exit 1; }
$MAKE install || { echo "Error installing binutils"; exit 1; }

cd ..

echo "End of build:" >> 06-temp.txt
date >> 06-temp.txt 
mv 06-temp.txt 06-ready.txt


