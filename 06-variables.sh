#!bin/bash
START_TIME=$(date +%s)

echo "script executed at: $START_TIME"

sleep 10

END_TIME=$(date +%S)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script excecuted in: $TOTAL_TIME seconds"
