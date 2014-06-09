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
# strip binaries
# strip has trouble using wildcards so do it this way instead
#---------------------------------------------------------------------------------

echo "Start of build:" > 11-temp.txt
date >> 11-temp.txt 


for f in \
	$prefix/bin/* \
	$prefix/$target/bin/* \
	$prefix/libexec/gcc/$target/$GCC_VER/*
do
	strip $f
done

#find $prefix -name "crt0.o" -exec rm {} \;
#find $prefix -name "*.la" -exec rm {} \;


echo "End of build:" >> 11-temp.txt
date >> 11-temp.txt 
mv 11-temp.txt 11-ready.txt



