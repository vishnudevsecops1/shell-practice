#!bin/bash
START_TIME=$(date +%s)

echo "script executed at: $TIMESTAMP"

sleep 10

END_TIME=$(date +%S)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script excecuted at: $TOTAL_TIME"
