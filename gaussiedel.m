n = 3; % no. of rows
A = [4 2 1;
    1 5 1;
    1 1 8];
b = [14; 10; 20];
x0 = [1,1,1];
x1 = zeros(n,1);
k = 0;
N = 1000;
tol = 10^-4;

while k<N
    for i=1:n
        sum=0;
        for j=1:i-1
            sum = sum + A(i,j)*x1(j);
        end

        for j=i+1:n
            sum = sum + A(i,j)*x0(j);
        end
    x1(i) = (b(i) - sum)/A(i,i);
    end
    if norm(x0-x1, inf) < tol
        break
    else 
        x0 = x1;
        k = k + 1;
    end
end
x1
k



