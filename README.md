# README
A Java prototype of Runtime Verification Tool

Running on fits(Financial Transaction System).

### Usage
enter src/script/ folder to manually write a property file.
then use
```sh
./run.sh -h 
```
to see usage

This tool consists of two parts: the frontend and the backend parts.

The frontend supports four properties: finite automata, Regular Expressions, LTL and real-time properties. The frontend will translate the properties into EGCL(Event Guarded Command Language).

And the backend will translate the EGCL script into AspectJ file. 

The `run.sh` script will first trigger the frontend based on the command line argument to translate the specification into AspectJ file. Then it will use ajc(AspectJ Compiler) to compile the AspectJ file, weaving it into the Java file. Then the written specifications will be checked.