function [totalVerbsInCategory, verbProbabilities] = categoryWiseGenerators( categoryName )
%UNTITLED2 Calculates probability of each verb occuring for a given
%category

 categoryFiles = dir(fullfile('ML10701-ESL','clustered_raw',categoryName,'*.txt'));
 docwiseVerbCounts = zeros(size(categoryFiles));
 docNames = struct2table(categoryFiles);
 docNames = docNames.name;

 dictionaryFile = dir(fullfile('ML10701-ESL','dictionary','DictionaryV.txt'));
 dictionaryFid = fopen(dictionaryFile.name);
 verbList = textscan(dictionaryFid,'%s', 'Delimiter','\n');
 verbList = unique(verbList{1,1});
 
 verbCounts = zeros(size(verbList));
 
 for i = 1:size(verbList, 1)
     for j = 1:size(categoryFiles, 1)
         freadid = fopen(categoryFiles(j).name);
         extractedWords=textscan(freadid,'%s', 'Delimiter',' ');
         newVerbCount = length(find(strcmp(extractedWords{1},verbList{i})));
         verbCounts(i) = verbCounts(i) + newVerbCount;
         docwiseVerbCounts(j) = docwiseVerbCounts(j) + newVerbCount;
         fclose(freadid);
     end
     
 end
 
 totalVerbsInCategory = sum(verbCounts);
 verbProbabilities = cellfun(@(x) (x/totalVerbsInCategory), {verbCounts},'un',0);
 verbProbabilities = cell2mat(verbProbabilities);
 
 TT = table(verbList, verbProbabilities, verbCounts);
 writetable(TT, sprintf('%s_verbProbabilities.dat', categoryName));
 
 TT = table(docNames, docwiseVerbCounts);
 writetable(TT, sprintf('%s_filewiseCounts.dat', categoryName));
 
 maxDocVerbsInCategory = max(docwiseVerbCounts);
 transitionprobs_Q_i_j = Q_i_j(categoryName, maxDocVerbsInCategory);
%  pairwiseprobmatrix_R_i_f_e = R_i_f_e(categoryName, verbList, maxDocVerbsInCategory);
%  pairwisejointprobs_R_i_f = R_i_f(categoryName, pairwiseprobmatrix_R_i_f_e, verbList, maxDocVerbsInCategory);
 
 fclose(dictionaryFid);
end