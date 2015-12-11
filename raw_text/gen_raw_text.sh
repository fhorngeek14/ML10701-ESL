#!/usr/bin/bash
taskDir=../muc34/TASK/CORPORA
for file in `ls $taskDir/dev-muc3*`; do
    gawk '/^DEV-MUC3/{match($0, /^DEV-MUC3-(.+?) +\(/,k)} {print >k[1]".txt" }' $file
done
for f in `ls *.txt`; do
    tail -n +3 $f > temp
    cat temp > $f
done
rm temp
