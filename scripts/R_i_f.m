function [ pairwisejointprobs_R_i_f ] = R_i_f(categoryName, pairwiseprobmatrix_R_i_f_e,...
    verbList, maxDocVerbsInCategory )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
  pairwisejointprobs_R_i_f = zeros([verbList, maxDocVerbsInCategory]);
 
 summationmatrix = (verbList*pairwiseprobmatrix_R_i_f_e)';
 matrixwidth = size(verbList)*maxDocVerbsInCategory;
 for i=1:size(summationmatrix)
     pairwisejointprobs_R_i_f(int64(i/matrixwidth) +1, mod(i, matrixwidth))...
         = summationmatrix(i);
 end
 
 TT = table(verbList, pairwisejointprobs_R_i_f);
 writetable(TT, sprintf('%s_pairwisejointprobs_R_i_f.dat', categoryName));

end

