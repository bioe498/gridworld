function [V,nv] = update_values(V,nv,P,k,l,terminal)

walks = random_walks(k,l,P);

% drop any walk that did not terminate
walks = walks(walks(:,l) == terminal,:);
k = size(walks,1);

for walk = 1:k
    for step = 1:l
        if walks(walk,step) == terminal
            break
        end
        reward = -sum(walks(walk,step:end) ~= terminal);
        s = walks(walk,step);
        V(s) = (nv(s)*V(s) + reward) / (nv(s) + 1);
        nv(s) = nv(s) + 1;
    end
end
