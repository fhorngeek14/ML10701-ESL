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
 
%  TT = table(verbList, verbProbabilities, verbCounts);
%  writetable(TT, sprintf('%s_verbProbabilities.dat', categoryName));
%  
%  TT = table(docNames, docwiseVerbCounts);
%  writetable(TT, sprintf('%s_filewiseCounts.dat', categoryName));
 
 maxDocVerbsInCategory = max(docwiseVerbCounts);
 transitionprobs_Q_i_j = Q_i_j(categoryName, maxDocVerbsInCategory);
 [pairwise_e1, pairwise_e2, pairwise_e3, pairwise_e4] = R_i_f_e(categoryName, verbList, maxDocVerbsInCategory);
 
%  pairwise1 = R_i_f(categoryName, pairwise_e1, verbProbabilities);
%  pairwise2 = R_i_f(categoryName, pairwise_e2, verbProbabilities);
%  pairwise3 = R_i_f(categoryName, pairwise_e3, verbProbabilities);
%  pairwise4 = R_i_f(categoryName, pairwise_e4, verbProbabilities);
%  
%   TT = table(verbList, pairwise1, pairwise2, pairwise3, pairwise4);
%  writetable(TT, sprintf('%s_pairwisejointprobs_R_i_f.dat', categoryName));


 fclose(dictionaryFid);
end