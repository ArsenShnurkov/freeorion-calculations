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

mkdir -p $(output_relpath)
/usr/bin/csc /r:System.dll /r:System.Configuration.dll fcalc.cs /main:fcalc /t:exe /out:$(output_relpath)/fcalc.exe
cp app.config $(output_relpath)/fcalc.exe.config
