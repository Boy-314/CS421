function [x] = tridiagonal_backwardsub(uMiddle,uUpper,y)
% uses backward substitution to solve Ux = y

[n,~] = size(y); % dimensions of x and y
x = zeros(n,1); % create x vector
x(n,1) = y(n,1) / uMiddle(n,1); % put in trivial solution for last x_n value

% solve the rest of the x's recursively
for i = n-1:-1:1
    % backward substitution
    x(i,1) = (y(i,1) - uUpper(i,1) * x(i+1,1))/uMiddle(i,1);
end

end

