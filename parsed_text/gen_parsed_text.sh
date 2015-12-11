#!/usr/bin/bash

## USEFUL CONSTANTS
rawDir=../raw_text
corenlpDir="../../stanford-corenlp-full-2015-04-20/"
caseLess="-pos.model edu/stanford/nlp/models/pos-tagger/english-caseless-left3words-distsim.tagger -parse.model edu/stanford/nlp/models/lexparser/englishPCFG.caseless.ser.gz -ner.model edu/stanford/nlp/models/ner/english.all.3class.caseless.distsim.crf.ser.gz,edu/stanford/nlp/models/ner/english.muc.7class.caseless.distsim.crf.ser.gz,edu/stanford/nlp/models/ner/english.conll.4class.caseless.distsim.crf.ser.gz"

## START MAIN PROGRAM
ls $rawDir/*.txt > fileList.txt
java -cp "${corenlpDir}*" -Xmx2g edu.stanford.nlp.pipeline.StanfordCoreNLP -props coreNLP.config $caseLess -filelist fileList.txt
