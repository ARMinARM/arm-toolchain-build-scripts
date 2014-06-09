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
# build and install mpc
#---------------------------------------------------------------------------------

echo "Start of build:" > 05-temp.txt
date >> 05-temp.txt 

mkdir -p mpc-build
cd mpc-build

if [ "$OSTYPE" = "msys" ]
then
export CFLAGS=-D__USE_MINGW_ACCESS
fi

../$MPC_SRC/configure $ABI_MODE \
	--prefix=$addon_tools_dir \
	--disable-shared \
	--enable-static \
	--with-gmp=$addon_tools_dir \
	--with-mpfr=$addon_tools_dir \
	|| { echo "Error configuring mpc"; exit 1; }

$MAKE || { echo "Error building mpc"; exit 1; }
$MAKE install || { echo "Error installing mpc"; exit 1; }

cd ..

echo "End of build:" >> 05-temp.txt
date >> 05-temp.txt 
mv 05-temp.txt 05-ready.txt


