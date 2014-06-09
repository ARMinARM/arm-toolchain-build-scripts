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
# build and install newlib
#---------------------------------------------------------------------------------

echo "Start of build:" > 08-temp.txt
date >> 08-temp.txt 

mkdir -p newlib-build
cd newlib-build
mkdir -p etc

#export LD_LIBRARY_PATH=$addon_tools_dir/lib:$LD_LIBRARY_PATH

#export CFLAGS="-I$addon_tools_dir/include"
#export LDFLAGS="-L$addon_tools_dir/lib"

../$NEWLIB_SRC/configure \
	--target=$target \
	--prefix=$prefix \
	--disable-newlib-supplied-syscalls \
	--enable-interwork \
	--enable-multilib \
	|| { echo "Error configuring newlib"; exit 1; }

$MAKE || { echo "Error building newlib"; exit 1; }
$MAKE install || { echo "Error installing newlib"; exit 1; }

cd ..

echo "End of build:" >> 08-temp.txt
date >> 08-temp.txt 
mv 08-temp.txt 08-ready.txt
