if [ $1 == "-egcl" ];
then
    cd src/pure_egcl/;
    javac -d . */*.java;
    java egcl.Main;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
elif [ $1 == "-automata" ];
then
    cd src/automata/;
    javac -d . */*.java;
    java automata.Main;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar fits.Main
elif [ $1 == "-re" ];
then
    cd src/re/;
    javac -d . */*.java;
    java re.Main;
    jar -cvf ./re.jar ./re;
    jar -cvf ./egcl.jar ./egcl;
    cp ./re.jar ../monitoredfits/re.jar;
    cp ./egcl.jar ../monitoredfits/egcl.jar;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:re.jar:egcl.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:re.jar:egcl.jar fits.Main
elif [ $1 == "-ltl" ];
then
    cd src/ltl/;
    javac -d . */*.java;
    java ltl.Main;
    jar -cvf ./ltl.jar ./ltl;
    jar -cvf ./egcl.jar ./egcl;
    cp ./ltl.jar ../monitoredfits/ltl.jar;
    cp ./egcl.jar ../monitoredfits/egcl.jar;
    cd ../monitoredfits/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:ltl.jar:egcl.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:ltl.jar:egcl.jar fits.Main
elif [ $1 == "-rtime" ];
then
    cd src/rtime/;
    javac -d . */*.java;
    java egcl.Main;
    jar -cvf ./timers.jar ./timers;
    jar -cvf ./egcl.jar ./egcl;
    cp ./timers.jar ../monitoredfits_rtime/timers.jar;
    cp ./egcl.jar ../monitoredfits_rtime/egcl.jar;
    cd ../monitoredfits_rtime/;
    ajc -18 */*.java */*.aj -cp aspectjrt.jar:timers.jar:egcl.jar;
    java -javaagent:aspectjweaver.jar -cp .:aspectjrt.jar:timers.jar:egcl.jar fits.Main
elif [ $1 == "-h" ];
then 
    echo "Usage: ./run.sh [option]"
    echo "Options:"
    echo "  -egcl: run the egcl example"
    echo "  -automata: run the automata example"
    echo "  -re: run the re example"
    echo "  -ltl: run the ltl example"
    echo "  -rtime: run the real-time example"
fi

