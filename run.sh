if [ $1 == "egcl" ];
then
    cd src/pure_egcl/;
    javac -d . */*.java;
    java egcl.Main;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
elif [ $1 == "automata" ];
then
    cd src/automata/;
    javac -d . */*.java;
    java automata.Main;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
fi
