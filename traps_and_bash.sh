#!/bin/bash
function cleanup {
  echo "I cleaned up"
}
function do_task {
  echo "I did a task"
}
trap cleanup EXIT

echo "let's do some commands"
echo "let's do some more commands"

do_task

t=$1
if [ $t -eq 1 ]; then
  echo "Script ends in success mode"
  exit 0
elif [ $t -eq 2 ]; then
  echo "Script ends in failing mode"
  exit 1
fi
