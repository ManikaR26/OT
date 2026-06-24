
f = @(x) [x(1)^2+x(2)^2-4;
    x(1)^2-x(2)^2-1];

J = @(x) [2*x(1) 2*x(2);
    2*x(1) -2*x(2)];

tol = 10^-2;
x0 = [1;1];

k = 1;
N = 1000;
while k<N
    y = inv(J(x0))*f(x0);
    x1 = x0-y;
    if norm(y) < tol
        break

    else
        x0 = x1;
    end
    k = k+1;
end
x1