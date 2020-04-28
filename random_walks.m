function [walks] = random_walks(k,l,P,starts)

N = size(P,1);

if nargin < 4
    starts = randi(N,k,1);
end

walks = zeros(k,l);
walks(:,1) = starts;

for i = 1:k
    for j = 2:l
        current = walks(i,j-1);
        p = P(current,:);
        walks(i,j) = randsrc(1,1,[1:N; p]);
    end
end
