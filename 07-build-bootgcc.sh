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
# build and install just the c compiler
#---------------------------------------------------------------------------------

echo "Start of build:" > 07-temp.txt
date >> 07-temp.txt 

mkdir -p gcc-build
cd gcc-build

export CFLAGS="-I$addon_tools_dir/include"
export LDFLAGS="-L$addon_tools_dir/lib"

if [ "$OSTYPE" = "msys" ]
then
export CFLAGS=-D__USE_MINGW_ACCESS
fi

../$GCC_SRC/configure \
	--target=$target \
	--prefix=$prefix \
	--disable-shared \
	--disable-nls \
	--disable-threads \
	--disable-libssp \
	--disable-libstdcxx-pch \
	--disable-libmudflap \
	--disable-libgomp -v \
	--enable-languages=c,c++ \
	--enable-interwork \
	--enable-multilib \
	--with-gcc \
	--with-gnu-ld \
	--with-gnu-as \
	--with-dwarf2 \
	--with-newlib \
	--with-headers=../newlib-$NEWLIB_VER/newlib/libc/include \
	--with-pkgversion='ARMinARM GCC' \
	--with-mpc=$addon_tools_dir \
	--with-mpfr=$addon_tools_dir \
	--with-gmp=$addon_tools_dir \
	|| { echo "Error configuring gcc"; exit 1; }

mkdir -p libiberty libcpp fixincludes

$MAKE all-gcc || { echo "Error building gcc"; exit 1; }
$MAKE install-gcc || { echo "Error installing gcc"; exit 1; }

cd ..

echo "End of build:" >> 07-temp.txt
date >> 07-temp.txt 
mv 07-temp.txt 07-ready.txt

