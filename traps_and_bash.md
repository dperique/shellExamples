Sometimes we want to ensure that a particular function gets run when
a script exits.  For example, you want to do some cleanup on exit and
don't want to have to put cleanup logic into the main logic of your script.

```
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
```
You can call this bash script in 3 ways:

* simulate a script passing (pass in a 1 as the first parameter)
* simulate a script failing (pass in a 2 as the first parameter)
* simulate a script neither passing of failing (pass in a 3 as the first parameter)

Note that in either case (i.e, exit as 0 or 1 or nothing), we always call the cleanup function.
This is due to the ``trap cleanup EXIT`` bash command.
