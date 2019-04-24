function [output] = Bx(B,x)
% multiplies a bidiagonal matrix B onto a vector x in R^n

% initialize size variables and output variable
[m,n] = size(B);
output = zeros(m,1);

% get the diagonal and super diagonal values of B
main_diag = diag(B);
super_diag = diag(B,1);

% compute the multiplication
for k = 1:n
    if k == n
        output(k) = main_diag(k)*x(k);
    else
        output(k) = main_diag(k)*x(k)+super_diag(k)*x(k+1);
    end
end
end

