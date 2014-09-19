apkfile=$1

rm -Rf output
mkdir output

sh dex2jar/d2j-dex2jar.sh -o output/output.jar $apkfile
java -jar jd-core-java/jd-core-java-1.2.jar output/output.jar output/src
rm output/output.jar

java -jar apktool/apktool.jar decode -f $apkfile output-res/

rm -Rf output-res/smali
rm output/apktool.yml

mv output-res/* output/
rm -Rf output-res/

exit;
