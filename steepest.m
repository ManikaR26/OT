clc;  clear;

f = @(x) x(1)^2 - x(1)*x(2) + x(2)^2

grad = @(x) [ 2*x(1) - x(2); -x(1) + 2*x(2)]

H = [2 -1  ;-1  2 ];   % constant Hessian
x = [1;0.5];
tol = 0.05;
maxiter = 10;
fprintf('Iter\t   x1\t\t   x2\t\t   f(x)\n');
for k = 1:maxiter
      g = grad(x);
    if norm(g) < tol
        break;
    end
    S = -g;
    lambda = (S'*S) / (S'*H*S);
    x = x + lambda * S;
    fprintf('%d\t %f\t %f\t %f\n', k, x(1), x(2), f(x));
end
fprintf('\nOptimal solution: x = (%f, %f)\n', x(1), x(2));
fprintf('Minimum value: f(x) = %f\n', f(x));