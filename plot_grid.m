function plot_grid(N,values,policy)

m = sqrt(N);
n = sqrt(N);
sz = [m n];

if nargin < 2
    values = 1:N;
end

dx = -0.35;
dy = -0.75;
if nargin < 3
    dx = -0.5;
    dy = -0.5;
end

plot([0 m m 0], [0 0 n n],'k');
hold on;
if ~isempty(values)
    for i = 1:N
        [row,col] = ind2sub(sz,i);
        text(row+dx, col+dy, num2str(values(i)));
    end
end

alpha = 0.8;
for j = 1:n-1
    plot([0 m],[j j],'Color',[alpha alpha alpha]);
end
for i = 1:m-1
    plot([i i],[0 n],'Color',[alpha alpha alpha]);
end

if nargin == 3
    for i = 1:N
        for j = 1:N
            if policy(i,j) > 0 && i ~= j
                [r1,c1] = ind2sub(sz,i);
                [r2,c2] = ind2sub(sz,j);
                p1 = [r1,c1] - [0.5 0.5];
                p2 = p1 + 0.35*[sign(r2-r1) sign(c2-c1)];
                arrow3(p1,p2,[],1,1);
            end
        end
    end
else
    arrow3([0 0],[0 0.01],'w',0.1,0.1);
end

set(gca,'XTick',[], 'YTick', [])
hold off;


