# ARM toolchain build scripts

Scripts for building the ARMinARM toolchain, a gcc-based ARM toolchain on Linux (target=arm-none-eabi) for building for the Cortex M0/M3/M4 line of ARM processors, using hardware floating point instructions (M4) and calling conventions.

Based almost entirely on YAGARTO build scripts by Michael Fischer: 

   - home: http://www.yagarto.org/
   - source: http://sourceforge.net/projects/yagarto/

The target is arm-none-eabi, and gcc is built with the following multilibs (arm-none-eabi-gcc --print-multi-lib):

    .;
    thumb;@mthumb
    thumb/thumb2;@mthumb@march=armv7
    thumb/armv6-m;@mthumb@march=armv6-m
    thumb/cortex-m4/float-abi-hard/fpuv4-sp-d16;@mthumb@mcpu=cortex-m4@mfloat-abi=hard@mfpu=fpv4-sp-d16

### Compiling for Cortex-M3

When building your programs the CFLAGS you want are:

    -mthumb -mcpu=cortex-m3 --march=armv7-m

### Compiling for Cortex-M4

When building your programs the CFLAGS you want are:

    -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16

You may also want:

    -mthumb-interwork -mlittle-endian

### Build

Install required packages

   - Debian: apt-get install build-essential automake bzip2 libtool gcc-multilib libncurses5-dev
   - Raspbian: apt-get install bzip2 libtool libncurses5-dev flex bison texlive
   - CentOS: yum install gcc gcc-c++ make autoconf glibc-devel.i386 libstdc++-devel.i386 automake ncurses-devel

Download / extract scripts

   - Set options for 32 or 64 bits in '_env-only.sh' (must match to host that does the cross compiling)
   - Update version numbers in '_env-only.sh' as needed (see download/README.md)

Download src packages into download directory (or skip to the next step, and run './auto.sh')

   - expat-2.0.1 http://sourceforge.net/projects/expat/files/expat/2.0.1/expat-2.0.1.tar.gz
   - zlib-1.2.3 ftp://ftp.spline.inf.fu-berlin.de/pub/gentoo/distfiles/zlib-1.2.3.tar.bz2
   - gmp-5.0.4 ftp://ftp.gmplib.org/pub/gmp-5.0.4/gmp-5.0.4.tar.bz2
   - mpfr-2.4.2 http://www.mpfr.org/mpfr-2.4.2/mpfr-2.4.2.tar.bz2
   - binutils-2.24  http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2
   - gcc-4.8.2 ftp://sources.redhat.com/pub/gcc/releases/gcc-4.8.2/gcc-4.8.2.tar.bz2
   - newlib-1.20.0 ftp://sources.redhat.com/pub/newlib/newlib-1.20.0.tar.gz
   - gdb-7.6.2 ftp://sources.redhat.com/pub/gdb/releases/gdb-7.6.2.tar.bz2
   - mpc-1.0.1 http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz

Run "./xx-build-all.sh" (or "./auto.sh" to download sources) to start the build
   - Go make a snack and watch a movie, it's going to take anywhere from 15 minutes to multiple hours.
   - The build *should* be successfull if there's a file named "xx-ready.txt" and a numbered "-ready.txt" for each build script.
   - 'xx-restart.sh' will delete all '*-build' directories and starts building from scratch.

### Install

    cd install
    mkdir /opt/arminarm
    cp -R * /opt/arminarm
    export PATH=$PATH:/opt/arminarm/bin    #or add to your .profile or whatever

### Uninstall

    rm -rf /opt/arminarm

### Credit

Credit goes to Michael Fischer (www.yagarto.org) for the original scripts. 

Changes/tweaks by the following people:

caspencer (https://github.com/caspencer/arm-toolchain-build-scripts)
- based on yagarto for Windows 20110429
- removed the MinGW/MSYS-specific stuff
- fixed some things regarding how libgmp is built and referenced (forced 32-bit build)
- added .log files for each numbered build script

amour03 (https://github.com/amoer03/arm-toolchain-build-scripts)
- extra script for downloading
- updated versions of sources
- extra environment vars

rktrlng/ARMinARM (https://github.com/rktrlng/arm-toolchain-build-scripts)
- scripts based on yagarto for OS X 20121222
- had to revert back to gmp-5.0.4 + mpfr-2.4.2 to get it to build on 64 bit (Ubuntu 13.10)
- gcc-4.8.2 and newlib-1.20.0 patches based on patches here: https://github.com/prattmic/arm-cortex-m4-hardfloat-toolchain

ARMinARM (https://github.com/ARMinARM/arm-toolchain-build-scripts)
- Raspberry Pi specific tweaks

