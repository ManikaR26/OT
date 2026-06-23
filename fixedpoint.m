%Fixed POINT
clc;
clear all;

g = @(x) (sqrt (x+2));

x0 = 1;
tol = 1e-2;
N=1000;

i=1;
while i<N

x1 = g(x0);
    if abs(x1-x0) < tol
        break;
    else
        x0 = x1;
    end
    i = i+1;

end

x1
i