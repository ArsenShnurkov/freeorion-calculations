#!/bin/bash

# inherit dotnet

function usedebug_tostring ( ) {
	local DIR=""
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	echo "${DIR}"
}

function output_relpath ( ) {
	echo "bin/$(usedebug_tostring)"
}

# ebuild script

function bin_dir ( ) {
	echo "$(output_relpath)"
}

/usr/bin/mono $(output_relpath)/fcalc.exe
