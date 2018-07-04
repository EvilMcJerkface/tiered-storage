#!/bin/bash

if [ $# -gt 2 ]; then
  echo "Usage: $0 <build>"
  echo "If no build option is specified, the test will default to not building."

  exit 1
fi

if [ -z "$1" ]; then
  BUILD="n"
else
  BUILD=$1
fi

echo "Starting local server..."
./scripts/start_local.sh $BUILD n

sleep 1

# wait until the routing tier has received a join from the server before making
# a request
JOIN=`cat log* | grep routing | grep 'Received join' | wc -l`
while [ $JOIN -eq 0 ]; do
  JOIN=`cat log* | grep routing | grep 'Received join' | wc -l`
done

sleep 3

echo "Running tests..."
./build/src/bedrock/user tests/simple/input > tmp.out

DIFF=`diff tmp.out tests/simple/expected`

if [ "$DIFF" != "" ]; then
  echo "Output did not match expected output (tests/simple/expected.out). Observed output was: "
  cat tmp.out
  rm tmp.out
  echo $DIFF
  CODE=1
else
  echo "Test succeeded!"
  CODE=0
fi

echo "Stopping local server..."
./scripts/stop_local.sh y
exit $CODE
