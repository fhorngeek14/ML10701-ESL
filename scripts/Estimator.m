%Run this script to generate the 3 different randomized latent
%probabilities at every iteration:
%
% 1) Q_{i,j} = P(G_{t+1} = j | G_t = i)
% 2) {R^{i,e}}_f = P(V_t = f | G_t = i, V_{t-1} = e)
% 3) P(G_1 = i)

categories = {'ROBBERY','KIDNAPPING','FORCED','BOMBING','ATTACK','ARSON'};
totalVerbsInCategory = zeros(size(categories));
verbProbabilitiesInCategory = zeros(size(categories));
transitionprobs_Q_i_j = zeros([size(categories), 50]);

for i = 1:size(categories,2)
    [totalVerbsInCategory(i), ~] = categoryWiseGenerators(categories{i});
end

