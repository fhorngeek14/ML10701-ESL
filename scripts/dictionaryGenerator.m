DictionaryS = [];
DictionaryV = [];
DictionaryO = [];

Files = dir(fullfile('ML10701-ESL','out', '*.txt.xml'));
    
filesaveformat = '%s\n';
    
for i = 1:size(Files)
    freadid = fopen(Files(i).name);
    extractedLines=textscan(freadid,'%s', 'Delimiter','\n');
    [DictionaryS, DictionaryO, DictionaryV] = updateDictionary(DictionaryS, DictionaryO, DictionaryV, extractedLines{1,1});
    fclose(freadid);
end

DictionaryS = DictionaryS';
DictionaryV = DictionaryV';
DictionaryO = DictionaryO';

fwriteid = fopen('DictionaryS.txt', 'w');
for i = 1:size(DictionaryS)
    fprintf(fwriteid, filesaveformat,DictionaryS{i,:});
end
fclose(fwriteid);

fwriteid = fopen('DictionaryV.txt', 'w');
for i = 1:size(DictionaryV)
    fprintf(fwriteid, filesaveformat,DictionaryV{i,:});
end
fclose(fwriteid);

fwriteid = fopen('DictionaryO.txt', 'w');
for i = 1:size(DictionaryO)
    fprintf(fwriteid, filesaveformat,DictionaryO{i,:});
end
fclose(fwriteid);
