function [subs] = ind2subs(sz,k)

[i,j] = ind2sub(sz,k);
subs = [i j];
