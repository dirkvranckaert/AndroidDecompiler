#!/bin/sh

# Read parameters
apkfile=$1
outputDir=$2

# Check a the minimum set of parameters is present. If not show help...
if [ -z $apkfile]
then
  echo "decompileAPK -- Decompiles an APK to have both the APK source and resources (XML
                , 9-patches,...) decompiled."
  echo ""
  echo "Usage: decompileAPK.sh <APK-file> [output-dir]"
  echo ""
  echo "Parameters:"
  echo " APK-file               The first parameter is required to be a valid APK file!"
  echo " Output Dir             The output directory is optional. If not set the
                         default will be used which is 'output' in the 
                         root of this tool directory."
  exit;
fi

# Check for the output directory. If not custom set, use the default
if [ -z $outputDir]
then
    outputDir="output"
else
    outputDir="$outputDir/output"
fi
resOutputDir="$outputDir/res-output"

echo "Decompiling APK file $apkfile"
echo "Results will be put in $outputDir"
echo ""

# Cleanup the output directories
echo "Cleaning up the output directories"
rm -Rf output
rm -Rf output-res
rm -Rf $outputDir
mkdir -p $outputDir

# Create JAR from APK file, then decompile that JAR to have Java files
echo "Extracting JAR file from APK"
sh dex2jar/d2j-dex2jar.sh -o $outputDir/output.jar $apkfile
echo "Decompiling JAR for Java files"
java -jar jd-core-java/jd-core-java-1.2.jar $outputDir/output.jar $outputDir/src
rm $outputDir/output.jar

# Extract all resources from the APK and remove all the unnecessary files from the output
echo "Extracting resources from APK file"
java -jar apktool/apktool.jar decode -f $apkfile $resOutputDir
rm -Rf $resOutputDir/smali
rm $resOutputDir/apktool.yml

# Move the resource-output to output directory
mv $resOutputDir/* $outputDir
rm -Rf $resOutputDir

exit;
