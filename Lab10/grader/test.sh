# example
# ./test.sh template.dig 

#!/bin/bash
PROGRAM=$1
TESTVECTOR=$2
# compile test program
echo "using: "$PROGRAM
echo "testset: "$TESTVECTOR
mkdir -p bin
g++ testgenerator.cpp  -o bin/testgenerator  
g++ testresult.cpp  -o bin/testresult  

./testgenerator  $2  bin/t.dig
java -cp Digital.jar CLI test $1 -tests bin/t.dig -verbose > results.txt
./testresult $2 results.txt
