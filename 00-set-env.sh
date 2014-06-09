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
# Setup the environment
# 
# This is done by a separate script, because if you have close your shell
# you can set the environment again with this script only.
#---------------------------------------------------------------------------------
. ./_env-only.sh

#---------------------------------------------------------------------------------
# Extract source packages
#---------------------------------------------------------------------------------

echo "Extracting $BINUTILS_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/binutils-$BINUTILS_VER.tar.bz2 || { echo "Error extracting "$BINUTILS_SRC; exit; }

echo "Extracting $GCC_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/$GCC_SRC.tar.bz2 || { echo "Error extracting "$GCC_SRC; exit; }

echo "Extracting $NEWLIB_SRC"
tar -xzvf $TOOLCHAIN_DL_DIR/$NEWLIB_SRC.tar.gz || { echo "Error extracting "$NEWLIB_SRC; exit; }

echo "Extracting $GDB_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/$GDB_SRC.tar.bz2 || { echo "Error extracting "$GDB_SRC; exit; }

echo "Extracting $GMP_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/$GMP_SRC.tar.bz2 || { echo "Error extracting "$GMP_SRC; exit; }

echo "Extracting $MPFR_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/$MPFR_SRC.tar.bz2 || { echo "Error extracting "$MPFR_SRC; exit; }

echo "Extracting $EXPAT_SRC"
tar -xzvf $TOOLCHAIN_DL_DIR/$EXPAT_SRC.tar.gz || { echo "Error extracting "$EXPAT_SRC; exit; }

echo "Extracting $ZLIB_SRC"
tar -xjvf $TOOLCHAIN_DL_DIR/$ZLIB_SRC.tar.bz2 || { echo "Error extracting "$ZLIB_SRC; exit; }

echo "Extracting $MPC_SRC"
tar -xzvf $TOOLCHAIN_DL_DIR/$MPC_SRC.tar.gz || { echo "Error extracting "$MPC_SRC; exit; }

#---------------------------------------------------------------------------------
# Apply patches
#---------------------------------------------------------------------------------
echo
echo "Patching $GCC_SRC"
patch -p1 -d $GCC_SRC < patches/$GCC_SRC.patch || { echo "Error patching "$GCC_SRC; exit; }
echo

echo
echo "Patching $NEWLIB_SRC"
patch -p1 -d $NEWLIB_SRC < patches/$NEWLIB_SRC.patch || { echo "Error patching "$NEWLIB_SRC; exit; }
echo

echo
echo "Patching $BINUTILS_SRC"
patch -p1 -d $BINUTILS_SRC < patches/$BINUTILS_SRC.patch || { echo "Error patching "$BINUTILS_SRC; exit; }
echo
