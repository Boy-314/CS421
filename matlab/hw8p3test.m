% test on random pos. def. matrix A that is 10 by 10
Q = randn(10);
A = Q'*diag(abs(randn(10,1)))*Q;

% run the following line to check that the eigenvalues are all positive
% eig(A)

% generate random b
b = randn(10,1);

% test hw8p3
[x_k,r_k,k] = hw8p3(A,b)