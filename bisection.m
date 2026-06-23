%BISECTION

clc;
clear all;

f = @(x) (x^2 - 2);
a = 1;
b = 2;
tol = 1e-2;

fa = f(a);
fb = f(b);

if f(a)*f(b) < 0
    fprintf('we can proceed\n');
else
    fprintf('we cannot proceed');
end

i = 0;

while abs(a-b) > tol
    c = (a+b)/2;
    i = i+1;

    if f(c)*f(a) < 0
        b = c;
    else
        a = c;
    end
end

c
i
