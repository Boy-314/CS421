function [lLower,uMiddle,uUpper] = tridiagonal_gauss_el(aLower,aMiddle,aUpper)
% special LU decomposition for tridiagonal matrices

% check user input
[a,~] = size(aLower);
[b,~] = size(aMiddle);
[c,~] = size(aUpper);
if (a ~= b - 1) || (a ~= c)
    error('invalid input size')
end

% create output vectors
lLower = zeros(a,1);
uUpper = aUpper; %uUpper is unchanged in this special case of LU decomposition without pivoting

% initialize first element
uUpper(1,1) = aUpper(1,1);

% perform LU factorization
for i = 1:a
    if i > 1 % update A diagonals after the first iteration
        aMiddle(i,1) = -lLower(i-1,1) * aUpper(i-1,1) + aMiddle(i,1);
    end
    lLower(i,1) = aLower(i,1)/aMiddle(i,1); %compute lLower
    aLower(i,1) = 0; % update A's lower diagonal
end

aMiddle(b,1) = -lLower(b-1,1) * aUpper(b-1,1) + aMiddle(b,1);
uMiddle = aMiddle;

end