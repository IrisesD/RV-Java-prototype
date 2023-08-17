cd src/MyRVTool/
javac -d . */*.java
java $1.Main
cd ../monitoredfits/
ajc -18 */*.java */*.aj -cp aspectjrt.jar
java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main