function [ part1, part2, part3, part4 ] = R_i_f_e( categoryName, verbList, maxDocVerbsInCategory )
% Generates for each category:
% 2) {R^{i,e}}_f = P(V_t = f | G_t = i, V_{t-1} = e)
% Access and train {R^{i,e}}_f as pairwiseprobmatrix_R_i_f_e(e,i*f) where e is the
% e-th and f is the f-th verb in the sorted list

 verblistsize = size(verbList,1);
 part1 = rand(verblistsize , int64(verblistsize/4) * maxDocVerbsInCategory);
 part2 = rand(verblistsize , int64(verblistsize/4) * maxDocVerbsInCategory);
 part3 = rand(verblistsize , int64(verblistsize/4) * maxDocVerbsInCategory);
 part4 = rand(verblistsize , int64(verblistsize/4) * maxDocVerbsInCategory);
  
 TT = table(verbList, part1, part2, part3, part4);
 writetable(TT, sprintf('%s_pairwiseprobmatrix_R_i_f_e.dat', categoryName));
 
end

