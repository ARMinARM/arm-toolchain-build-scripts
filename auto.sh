#!/bin/sh

. ./_env-only.sh

#expat
wget --directory-prefix=$TOOLCHAIN_DL_DIR http://sourceforge.net/projects/expat/files/expat/$EXPAT_VER/$EXPAT_SRC.tar.gz

#zlib
wget --directory-prefix=$TOOLCHAIN_DL_DIR ftp://ftp.spline.inf.fu-berlin.de/pub/gentoo/distfiles/$ZLIB_SRC.tar.bz2

#gmp
wget --directory-prefix=$TOOLCHAIN_DL_DIR ftp://ftp.gmplib.org/pub/$GMP_SRC/$GMP_SRC.tar.bz2

#mpfr
wget --directory-prefix=$TOOLCHAIN_DL_DIR http://www.mpfr.org/$MPFR_SRC/$MPFR_SRC.tar.bz2

#binutils
wget --directory-prefix=$TOOLCHAIN_DL_DIR http://ftp.gnu.org/gnu/binutils/$BINUTILS_SRC.tar.bz2

#gcc
wget --directory-prefix=$TOOLCHAIN_DL_DIR ftp://sources.redhat.com/pub/gcc/releases/gcc-$GCC_VER/$GCC_SRC.tar.bz2

#newlib
wget --directory-prefix=$TOOLCHAIN_DL_DIR ftp://sources.redhat.com/pub/newlib/$NEWLIB_SRC.tar.gz

#gdb
wget --directory-prefix=$TOOLCHAIN_DL_DIR ftp://sources.redhat.com/pub/gdb/releases/$GDB_SRC.tar.bz2

#mpc
wget --directory-prefix=$TOOLCHAIN_DL_DIR http://www.multiprecision.org/mpc/download/$MPC_SRC.tar.gz

bash ./xx-build-all.sh
pwd
