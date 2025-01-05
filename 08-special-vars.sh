#!/bin/bash

echo "All variables passed: $@"
echo "Numbers of variables: $#"
echo "scrip name: $0"
echo "present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last last command is background: $!"