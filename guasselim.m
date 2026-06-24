% x1+x2+x3=6
% 2x1+x2+x3=14
% x1+2x2+3x3=14

A = [1 1 1 6;
    2 1 1 14;
    1 2 3 14];

n = 3; %no. of rows

for i=1:n-1
    for j=i+1:n
        k = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - k*A(i,:);
    end
end

x = zeros(n,1);

x(n) = A(n,n+1)/A(n,n);

for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum = A(i,j)*x(j) + sum;
    end
    x(i) = (A(i,n+1) - sum)/A(i,i);
end

x






