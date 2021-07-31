mkdir --parents $1/bin/classes
mkdir --parents $1/src/com/herokuapp/s3_$1

echo javac src/com/herokuapp/s3_$1/*.java -cp bin/classes -d bin/classes > $1/compile-all.sh

chmod a+x $1/compile-all.sh

echo java -cp bin/classes com.herokuapp.s3_$1.Main > $1/run-main.sh

chmod a+x $1/run-main.sh

echo package com.herokuapp.s3_$1";" > $1/src/com/herokuapp/s3_$1/Main.java
echo "public class Main {" >> $1/src/com/herokuapp/s3_$1/Main.java
echo "    public static void main(String[] args) {" >> $1/src/com/herokuapp/s3_$1/Main.java
echo "        System.out.println(\"Ahoj svet.\");" >> $1/src/com/herokuapp/s3_$1/Main.java
echo "    }" >> $1/src/com/herokuapp/s3_$1/Main.java
echo "}" >> $1/src/com/herokuapp/s3_$1/Main.java

echo "Manifest-Version: 1.0" > $1/manifest.mf
echo Main-Class: com.herokuapp.s3_$1.Main >> $1/manifest.mf
# echo Class-Path: libs/mongo-java-driver-3.12.1.jar >> $1/manifest.mf

echo "jar cvmf manifest.mf s3_"$1".jar -C bin/classes com" > $1/make-jar.sh

chmod a+x $1/make-jar.sh

