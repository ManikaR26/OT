
clc;
clear all;

f = @(x) x^2 - 2;

g = @(x) 2*x;

x0 = 1.5;
x1 = x0 - f(x0)/g(x0);

N = 1000;
tol = 10^-2;

i = 1;
while i < N
    x1 = x0 - f(x0)/g(x0);
    if abs(x0 - x1) < tol
        break;
    else
        x0 = x1;
    end
    i=i+1;
end

i
x1

