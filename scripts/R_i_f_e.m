function [ pairwiseprobmatrix_R_i_f_e ] = R_i_f_e( categoryName, verbList, maxDocVerbsInCategory )
% Generates for each category:
% 2) {R^{i,e}}_f = P(V_t = f | G_t = i, V_{t-1} = e)
% Access and train {R^{i,e}}_f as pairwiseprobmatrix_R_i_f_e(e,i*f) where e is the
% e-th and f is the f-th verb in the sorted list

 verblistsize = size(verbList);
 pairwiseprobmatrix_R_i_f_e = rand([verblistsize, verblistsize * maxDocVerbsInCategory]);
 
 TT = table(verbList, pairwiseprobmatrix_R_i_f_e);
 writetable(TT, sprintf('%s_pairwiseprobmatrix_R_i_f_e.dat', categoryName));
 
end

