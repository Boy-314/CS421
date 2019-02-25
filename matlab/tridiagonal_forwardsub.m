function [y] = tridiagonal_forwardsub(lLower,b)
% uses forward substitution to solve Ly=b

[n,~] = size(b); % dimensions of y and b
y = zeros(n,1); % create y vector
y(1,1) = b(1); % put in trivial solution for first y_1 value

% solve the rest of the y's recursively
for i = 2:n
    % forward substitution
    y(i,1) = b(i,1) - lLower(i-1,1) * y(i-1,1);
end

end

