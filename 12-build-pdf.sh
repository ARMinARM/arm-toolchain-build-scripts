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
# Call all scripts for building the PDF
#---------------------------------------------------------------------------------

echo "Start of build:" > 12-temp.txt
date >> 12-temp.txt 

cd binutils-build
make install-pdf
cd ..

cd gcc-build
make install-pdf
cd ..

cd newlib-build
make pdf
cp arm-none-eabi/newlib/libc/libc.pdf $prefix/share/doc
cp arm-none-eabi/newlib/libm/libm.pdf $prefix/share/doc
cd ..

cd gdb-build
make install-pdf
cd ..

#rm $prefix/share/doc/libquadmath.pdf

echo "End of build:" >> 12-temp.txt
date >> 12-temp.txt 
mv 12-temp.txt 12-ready.txt



