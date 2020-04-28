function [P] = update_policy(V,A)

N = size(V,1);
P = zeros(N);

for s = 1:N
    vs = V;
    vs(A(s,:) == 0) = -Inf;
    [~,idx] = max(vs);
    P(s,idx) = 1;
end
