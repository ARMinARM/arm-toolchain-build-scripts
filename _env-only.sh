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

if [ -z "$TOOLCHAIN_DL_DIR" ]; then
export TOOLCHAIN_DL_DIR=download
fi

export target=arm-none-eabi
export scripts_root=$(pwd)
export prefix=$(pwd)/install
#export MAKE=make -j8
export MAKE=make
export addon_tools_dir=$(pwd)/addontools

mkdir -p $prefix
mkdir -p $addon_tools_dir

export PATH="$PATH:$prefix/bin"


#---------------------------------------------------------------------------------
# Specify the version we will use
#---------------------------------------------------------------------------------
export ABI_MODE=           # 'standard' (try this first!)
#export ABI_MODE='ABI=32'   # force 32 bit
#export ABI_MODE='ABI=64'   # force 64 bit

#export CC='gcc -m64'       # 64 bit (comment out this line for 32 bit)


BINUTILS_VER=2.24
export GCC_VER=4.8.2
#export NEWLIB_VER=2.1.0
export NEWLIB_VER=1.20.0
GDB_VER=7.6.2
#GMP_VER=5.1.3
GMP_VER=5.0.4
#MPFR_VER=3.1.2
MPFR_VER=2.4.2
EXPAT_VER=2.0.1
ZLIB_VER=1.2.3
#MPC_VER=0.8.1
MPC_VER=1.0.1


#---------------------------------------------------------------------------------
# Specify the source we will use
#---------------------------------------------------------------------------------
export BINUTILS_SRC="binutils-$BINUTILS_VER"
export GCC_SRC="gcc-$GCC_VER"
export NEWLIB_SRC="newlib-$NEWLIB_VER"
export GDB_SRC="gdb-$GDB_VER"
export GMP_SRC="gmp-$GMP_VER"
export MPFR_SRC="mpfr-$MPFR_VER"
export EXPAT_SRC="expat-$EXPAT_VER"
export ZLIB_SRC="zlib-$ZLIB_VER"
export MPC_SRC="mpc-$MPC_VER"
