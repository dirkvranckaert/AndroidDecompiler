#!/bin/sh

DOE="`dirname \"$0\"`"

function help
{
  echo "releaseAPKDecompiler -- Release a new version of Android Decompiler"
  echo ""
  echo "usage: releaseAPKDecompiler.sh [options]"
  echo ""
  echo "options:"
  echo " -v,--version <version>	The version of this release"
  echo " -d,--dir <path>		The path were release file will be put"
  echo " -h,--help		Prints this help message"
}

#Init values
version=
outputDir=
temp=

# Check all of the possible options
while [[ "$1" == -* ]]; do
    case $1 in
        -v | --version )         shift
        						version=$1
                                ;;
        -d | --dir )        	shift
        						outputDir=$1
                                ;;
        -h | --help )           help
                                exit
                                ;;
    esac
    shift
done

# Check a the minimum set of parameters is present. If not show help...
if [ -z $outputDir ] || [ -z $version ]
then
  help
  exit
fi

echo "Releasing version $version to directory $outputDir"
echo ""

# Cleanup the output directories
echo "Cleaning up the output directory"
rm -Rf $DOE/output
rm -Rf $DOE/output-res
mkdir -p $outputDir

# Copy all the files
echo "Preparing release..."
temp="$outputDir/AndroidDecompiler"
mkdir -p $temp
cp -r $DOE/* $temp/
echo "Removing all unncessary files"
rm $temp/releaseAPKDecompiler.sh
rm $temp/README.md

echo "Zipping all files together"
pushd $temp
zip -r $outputDir/AndroidDecompiler-$version.zip ./*
tar -cvf $outputDir/AndroidDecompiler-$version.tar.gz ./*
popd
rm -Rf $temp

exit;