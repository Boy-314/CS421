function [x] = backwardsub(U,y)
% uses backward substitution to solve Ux = y

[n,~] = size(y); % dimensions of x and y
x = zeros(n,1); % create x vector
x(n,1) = y(n) / U(n,n); % put in trivial solution for last x_n value

% solve the rest of the x's recursively
for i = n-1:-1:1
    % initate x_i
    x(i,1) = y(i,1);
    for j = i+1:n
        % forward substitution
        x(i,1) = x(i,1) - U(i,j) * x(j,1);
    end
    x(i,1) = x(i,1) / U(i,i);
end

end