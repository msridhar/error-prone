#!/bin/sh

# note: requires ripgrep to have already been installed: https://github.com/BurntSushi/ripgrep

if [ -e showChecksOutput.txt.gz ]
then 
  gzip -d showChecksOutput.txt.gz
fi
if [ ! -e showChecksOutput.txt ]
then
  echo "saved output missing; aborting"
  exit 1
fi
COUNT=$(rg -U --count "build\(\)\n(.*)\n   expected: DECLARED @CalledMethods\(.*\n success" showChecksOutput.txt)
echo "${COUNT} verified calls"
gzip showChecksOutput.txt