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
# Call all scripts for recompiling the toolchain
#---------------------------------------------------------------------------------

rm -rf *-*.txt \
*.log \
install \
addontools \
*-build

echo "Start of build:" > xx-temp.txt
date >> xx-temp.txt 

. ./_env-only.sh

./01-build-expat.sh 2>&1 | tee -a 01-build-expat.log

./02-build-zlib.sh 2>&1 | tee -a 02-build-zlib.log

./03-build-gmp.sh 2>&1 | tee -a 03-build-gmp.log

./04-build-mpfr.sh 2>&1 | tee -a 04-build-mpfr.log

./05-build-mpc.sh 2>&1 | tee -a 05-build-mpc.log

./06-build-binutils.sh 2>&1 | tee -a 06-build-binutils.log

./07-build-bootgcc.sh 2>&1 | tee -a 07-build-bootgcc.log

./08-build-newlib.sh 2>&1 | tee -a 08-build-newlib.log

./09-build-gcc.sh 2>&1 | tee -a 09-build-gcc.log

./10-build-gdb.sh 2>&1 | tee -a 10-build-gdb.log

./11-strip.sh 2>&1 | tee -a 11-strip.log

./12-build-pdf.sh 2>&1 | tee -a 12-build-pdf.log

echo "End of build:" >> xx-temp.txt
date >> xx-temp.txt 
mv xx-temp.txt xx-ready.txt
