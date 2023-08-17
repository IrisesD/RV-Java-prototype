cd src/MyRVTool/
javac -d . */*.java
if (($1 == egcl || $1 == automata))
then
    java $1.Main
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
fi
if (($1 == re))
then
    java $1.Main
    jar -cvf ./re.jar ./re/
    jar -cvf ./egcl.jar ./egcl/
    cp re.jar ../monitoredfits/re.jar
    cp egcl.jar ../monitoredfits/egcl.jar
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:re.jar:egcl.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
fi
if (($1 == ltl))
then
    java $1.Main
    jar -cvf ./ltl.jar ./ltl
    jar -cvf ./egcl_ltl.jar ./egcl_ltl
    cp ltl.jar ../monitoredfits/ltl.jar
    cp egcl_ltl.jar ../monitoredfits/egcl_ltl.jar
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:ltl.jar:egcl_ltl.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:ltl.jar fits.Main
fi