clc;
clear;

% Min f(x1, x2) = x1^2 + x2^2 + x1*x2
% Starting point: x0 = (2, 2)
% Learning rate alpha = 0.1

% Define the objective function and its gradient as function handles.
% Change f and grad_f to solve a different problem.
f      = @(x) x(1)^2 + x(2)^2 + x(1)*x(2);
grad_f = @(x) [2*x(1) + x(2);
               2*x(2) + x(1)];

x = [2; 2];       % starting point (change as needed)
alpha = 0.1;      % learning rate
tol = 1e-5;
max_iter = 1000;

for k = 1:max_iter

    % Gradient
    grad = grad_f(x);

    % Update
    x_new = x - alpha * grad;

    if norm(x_new - x) < tol
        break;
    end

    x = x_new;
end

disp('Optimal point:');
disp(x);

disp('Minimum value:');
disp(f(x));