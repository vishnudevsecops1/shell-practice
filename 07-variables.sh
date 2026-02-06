#!bin/bash

### special variables ###
echo "All args passed to script: $@"
echo "Number of vars passed to script: $#"
echo "script name: $0"
echo "present directory: $pwd"
echo "who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"

