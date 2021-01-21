#!/bin/sh -l

# Set paths
export PATH="/usr/lib/gbdk/include:/usr/lib/gbdk/bin":$PATH
export LD_LIBRARY_PATH="/usr/local/lib64/":$LD_LIBRARY_PATH

echo "-----------"
echo which gcc
echo "-----------"
alias gbdkcc='/usr/lib/gbdk/bin/lcc -Wa-l -Wl-j -DUSE_SFR_FOR_REG -I /usr/lib/gbdk/include/'

# Switch directory
echo "Chosen directory: $1"
cd $1

# Compile main.c
gbdkcc -c -o game.o main.c
gbdkcc -o game.gb game.o