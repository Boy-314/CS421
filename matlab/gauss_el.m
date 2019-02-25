function [L,U]=gauss_el(A)
%
% On entry: A is a square matrix
% On exit: returns the LU decomposition of A
%

% check if the input is valid
[m,n] = size(A);
if m ~= n
    error('A is not a square matrix')
end

L = eye(m);
U = A;

for k = 1:n-1  % the kth step eliminates the kth column below the diagonal element
    M = eye(m); % matrix used to calculate U
    for i = k+1:n  % We need to work on rows k+1 to n of the kth column
        mult = U(i,k)/U(k,k);  % multiplier which will give desired zero
        L(i,k) = mult; % set the value of the L matrix
        M(i,k) = -1 * mult; % set value for M matrix to compute U
    end
    U = M * U; % compute U
end

% put 0's in the lower triangular matrix U
for i = 1:n-1
    U(n:-1:i+1,i) = 0;
end

end