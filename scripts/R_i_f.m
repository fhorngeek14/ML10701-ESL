function [ pairwisepartialmatrix ] = R_i_f(categoryName, pairwiseprobmatrix_R_i_f_e,...
    verbProbabilities)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
verbProbabilities = verbProbabilities';
    summationmatrix = (verbProbabilities*pairwiseprobmatrix_R_i_f_e)';
    matrixwidth = size(summationmatrix,2);
    
    pairwisepartialmatrix = zeros([size(verbProbabilities,2), matrixwidth*4]);

    for i=1:size(summationmatrix)
        pairwisepartialmatrix(int64(i/matrixwidth*4) +1, mod(i, matrixwidth*4))...
         = summationmatrix(i);
    end

end

