function [P] = probmat(X,dim)

if nargin < 2
    dim = 1;
end

P = X;

if dim == 1
    P = P';
end

for i = 1:size(X,1)
    P(i,:) = P(i,:) / sum(P(i,:));
end

if dim == 1
    P = P';
end