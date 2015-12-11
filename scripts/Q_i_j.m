function [ transitionprobs_Q_i_j ] = Q_i_j( categoryName, maxDocVerbsInCategory )
% Generates for each category and writes into file:
% 1) Q_{i,j} = P(G_{t+1} = j | G_t = i)
    transitionprobs_Q_i_j = rand([maxDocVerbsInCategory - 1,1]);
    TT = table(transitionprobs_Q_i_j);
    writetable(TT, sprintf('%s_transitionprobs_Q_i_j.dat', categoryName));
end

