clc;
clear;

% Min Z = 2x1 + 3x2
% x1 + x2 >= 4
% x1 + 2x2 = 6
% x1, x2 >= 0

M = 1000;

% Tableau: x1 x2 s1 a1 a2 | RHS
% Columns: [decision vars | surplus/slack vars | artificial vars | RHS]
T = [1 1 -1 1 0 4;
     1 2  0 0 1 6;
    -2 -3  0 -M -M 0];

% art_cols: column indices of artificial variables in T
% Change this to match your tableau (e.g. [4] if only one artificial var,
% or [5 6] if artificials are in columns 5 and 6, etc.)
art_cols = [4, 5];

[m, n] = size(T);

% Fix objective row: for each constraint row whose basic variable is an
% artificial, add M * that row to eliminate the artificial from the objective
for k = 1:length(art_cols)
    for i = 1:m-1
        if T(i, art_cols(k)) == 1
            T(end,:) = T(end,:) + M * T(i,:);
        end
    end
end

max_iter = 50;
iter = 0;

while true
    iter = iter + 1;

    if iter > max_iter
        disp('Iteration limit reached');
        break;
    end

    % Entering variable
    [min_val, pivot_col] = min(T(end,1:end-1));

    if min_val >= 0
        break;
    end

    % Leaving variable
    ratios = inf(m-1,1);
    for i = 1:m-1
        if T(i,pivot_col) > 0
            ratios(i) = T(i,end) / T(i,pivot_col);
        end
    end

    [min_ratio, pivot_row] = min(ratios);

    if isinf(min_ratio)
        disp('Unbounded solution');
        break;
    end

    % Pivot
    pivot_element = T(pivot_row, pivot_col);
    T(pivot_row,:) = T(pivot_row,:) / pivot_element;

    for i = 1:m
        if i ~= pivot_row
            T(i,:) = T(i,:) - T(i,pivot_col) * T(pivot_row,:);
        end
    end
end

disp('Final Tableau:');
disp(T);

disp('Optimal value of Z:');
disp(T(end,end));