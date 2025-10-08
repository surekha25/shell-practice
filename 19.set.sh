#!/bin/bash

set -e

trap 'echo "There is an error in Line Number: $LINENO, Command is $BASH_COMMAND"' ERR

echo "Hello ..."

echo "Before Error.."
 
dsfsdfsdf dnf # here shell understands there is an error and signal is ERR

echo "After Error"