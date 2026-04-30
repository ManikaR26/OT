cost = [11 20 7 8; 21 16 10 12; 8 12 18 9];
A = [50 40 70];
B = [30 25 35 40];
if sum(A) ~= sum(B)
    if sum(A) < sum(B)
        cost(end +1, :) = 0;
        A(end+1) = sum(B) - sum(A)
    else
        cost(:, end+1) = 0
        B(end+1) = sum(A) - sum(B)
    end
end
ICost = cost
X = zeros(size(cost))
[m,n] = size(cost)

while any(A) && any(B)
    [~, idx] = min(cost(:));
    [i,j] = ind2sub(size(cost), idx);
    x = min(A(i), B(j));
    X(i,j) = x;
    A(i) = A(i) - x;
    B(j) = B(j) - x;
    cost(i,j) = inf;
end   
disp('INitial BFS: ')
disp(array2table(X))
fprintf('cost = %d\n', sum(sum(ICost.*X)))