#!/bin/sh

result=$(cat compileOutput.txt | grep "build()" | cut -f 2 -d ' ' | paste -sd+ - | bc)
echo "${result} calls to build"