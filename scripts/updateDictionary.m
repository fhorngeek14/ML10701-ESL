function [DictionaryS, DictionaryO, DictionaryV] = updateDictionary(DictionaryS, DictionaryO, DictionaryV, allLines)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    subjectIndex = 1;
    verbIndex = 2;
    objectIndex = 3;

    for i = 1:size(allLines)
        lineInput = strsplit(allLines{i}, '\t');
        DictionaryS = insertWord(DictionaryS, lineInput(subjectIndex));
        DictionaryV = insertWord(DictionaryV, lineInput(verbIndex));
        DictionaryO = insertWord(DictionaryO, lineInput(objectIndex));
    end
end