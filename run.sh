cd src/MyRVTool/

if (($1 == egcl || $1 == automata))
then
    javac -d . egcl/*.java
    javac -d . automata/*.java
    java $1.Main
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
fi
if (($1 == re))
then
    javac -d . egcl_re/*.java
    javac -d . re/*.java
    java $1.Main
    jar -cvf ./re.jar ./re
    jar -cvf ./egcl_re.jar ./egcl_re
    cp re.jar ../monitoredfits/re.jar
    cp egcl_re.jar ../monitoredfits/egcl_re.jar
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:re.jar:egcl_re.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:re.jar fits.Main
fi
if (($1 == ltl))
then
    javac -d . egcl_ltl/*.java
    javac -d . ltl/*.java
    java $1.Main
    jar -cvf ./ltl.jar ./ltl
    jar -cvf ./egcl_ltl.jar ./egcl_ltl
    cp ltl.jar ../monitoredfits/ltl.jar
    cp egcl_ltl.jar ../monitoredfits/egcl_ltl.jar
    cd ../monitoredfits/
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:ltl.jar:egcl_ltl.jar
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:ltl.jar fits.Main
fi