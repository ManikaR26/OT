clc; clear; format short

% Minimize z = 2x1 + x2
M = 1000;

Cost = [2 1 0 0 M M 0];   % No sign change
A = [3 1 0 0 1 0 3;
     4 3 -1 0 0 1 6;
     1 2 0 1 0 0 3];

[m,n] = size(A);

% Find initial Basic Variables
BV = [];
I = eye(m);
for i = 1:m
    for j = 1:n
        if isequal(A(:,j), I(:,i))
            BV(i) = j;
        end
    end
end

while true
    ZjCj = Cost(BV)*A - Cost;

    % For minimization: check all <= 0
    if all(ZjCj(1:end-1) <= 0)
        disp('Optimal solution reached');
        break;
    end

    % Entering variable (max positive)
    [~, pcol] = max(ZjCj(1:end-1));

    % Ratio test
    col = A(:,pcol); sol = A(:,end);
    ratio = sol ./ col;
    ratio(col <= 0) = inf;

    [~, prow] = min(ratio);

    % Pivot
    BV(prow) = pcol;
    A(prow,:) = A(prow,:) / A(prow,pcol);

    for i = 1:m
        if i ~= prow
            A(i,:) = A(i,:) - A(i,pcol)*A(prow,:);
        end
    end
end

% Final BFS
BFS = zeros(1,n);
BFS(BV) = A(:,end);
Z = sum(BFS .* Cost);

disp('Optimal BFS:');
disp(BFS);
disp(['Minimum Value Z = ', num2str(Z)]);