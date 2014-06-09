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
# build and install the final compiler
#---------------------------------------------------------------------------------

echo "Start of build:" > 09-temp.txt
date >> 09-temp.txt 

cd gcc-build

#export LD_LIBRARY_PATH=$addon_tools_dir/lib:$LD_LIBRARY_PATH

#export CFLAGS="-I$addon_tools_dir/include"
#export LDFLAGS="-L$addon_tools_dir/lib"

$MAKE || { echo "Error building gcc2"; exit 1; }
$MAKE install || { echo "Error installing gcc2"; exit 1; }

cd ..

echo "End of build:" >> 09-temp.txt
date >> 09-temp.txt 
mv 09-temp.txt 09-ready.txt
