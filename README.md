Android Decompiler
==================

The Android Decompile is a script that combines different tools for succesfully decompiling any Android package (APK) to it's Java source-code and resources (including the AndroidManifest.xml, 9-patches, layout files,...).

Tools
-----
To accomplish the goal of a full decompile we use these tools:
- Dex2Jar : Version 0.0.9.15
- android-apktool : Version 1.5.2
- JD-Core-Java : Version 1.2
- Artistic Style (astyle) : Version 2.04


Supported Platforms
-------------------
The tools has been built on Mac, but most of it should work on all UNIX environments!
Code formatting is not guaranteed to work on all platforms.

Usage
-----
```
usage: decompileAPK.sh [options] <APK-file>

options:
 -o,--output <dir>	The output directory is optional. If not set the
                         default will be used which is 'output' in the 
                         root of this tool directory.
 --skipResources	Do not decompile the resource files
 --skipJava		Do not decompile the JAVA files
 -f,--format		Will format all Java files to be easier readable. 
  			 However, use with CAUTION! This option might change 
  			 line numbers!
 -p,--project		Will generate a Gradle-based Android project for you
 -h,--help		Prints this help message

parameters:
 APK-file               A valid APK file is required as input
```

Contributions
-------------
Any pull requests submitted will be looked at and if it really adds any aditional value they will be accepted. Any change-ideas are welcome!

License
-------
This tool has been released under the Apache License 2.0.
- Dex2Jar is licensed under the Apache License 2.0.
- android-apktool is licensed under the Apache License 2.0
- JD-Core-Java is licensed under the MIT License
- Artistic Style is licensed under the GNU Lesser General Public License Version 3

This project may be freely used for personal needs in a commercial or non-commercial environments.
