Android Decompiler
==================

The Android Decompile is a script that combines different tools for succesfully decompiling any Android package (APK) to it's Java source-code and resources (including the AndroidManifest.xml, 9-patches, layout files,...).

Tools
-----
To accomplish the goal of a full decompile we use these tools:
- Dex2Jar : Version 0.0.9.15
- android-apktool : Version 1.5.2
- JD-Core-Java : Version 1.2


Supported Platforms
-------------------
The tools has been built on Mac, but should work on all UNIX environments!

Usage
-----
decompileAPK.sh <APK-file> [output-dir]
Parameters:
 APK-file               The first parameter is required to be a valid APK file!
 Output Dir             The output directory is optional. If not set the
                         default will be used which is 'output' in the 
                         root of this tool directory.

Contributions
-------------
Any pull requests submitted will be looked at and if it really adds any aditional value they will be accepted. Any change-ideas are welcome!

License
-------
This tool has been released under the Apache License 2.0.
- Dex2Jar is licensed under the Apache License 2.0.
- android-apktool is licensed under the Apache License 2.0
- JD-Core-Java is licensed under the MIT License

This project may be freely used for personal needs in a commercial or non-commercial environments.
