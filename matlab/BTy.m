function [output] = BTy(BT,y)
% multiplies B^T onto a vector y in R^m efficiently

% initialize size variables and output variable
[n,~] = size(BT);
output = zeros(n,1);

% get the diagonal and sub diagonal values of B
main_diag = diag(BT);
sub_diag = diag(BT,-1);

% compute the multiplication
for k = 1:n
    if k == 1
        output(k) = main_diag(k)*y(k);
    else
        output(k) = sub_diag(k-1)*y(k-1)+main_diag(k)*y(k);
    end
end

end

