#! /usr/bin/env bash
# vim: set ts=3 sw=3 noet ft=sh : bash

SCRIPT="${0#./}"
BASE_DIR="${SCRIPT%/*}"
WORKDIR="$PWD"

if [ "$BASE_DIR" = "$SCRIPT" ]; then
	BASE_DIR="$WORKDIR"
else
	if [[ "$0" != /* ]]; then
		# Make the path absolute
		BASE_DIR="$WORKDIR/$BASE_DIR"
	fi
fi

# The Wii build rules have all been moved to libretro-build.sh

if [[ -z "$1" ]]; then
WANT_CORES=" \
#	2048 \
#	bluemsx \
#	snes9x2005  \
#	fceumm  \
#	fmsx \
#	gambatte \
#	genesis_plus_gx \
#	mednafen_gba \
#	mednafen_lynx \
#	mednafen_ngp \
#	mednafen_pce_fast \
#	mednafen_pcfx \
#	mednafen_supergrafx \
#	mednafen_wswan \
#	picodrive \
#	nestopia \
#	nxengine \
#	quicknes \
#	prboom \
#	snes9x2010 \
#	snes9x \
#	vba_next \
#	tyrquake \
#	mame2003 \
#	mame2000 \
#	mgba \
#	fbalpha2012_cps1 \
#	fbalpha2012_cps2 \
#	fbalpha2012_neogeo \
#	fbalpha2012 \
#	stella \
#	fba \
#  gpsp"
else
WANT_CORES="$@"
fi

platform=wii ${BASE_DIR}/libretro-build.sh ${WANT_CORES}
