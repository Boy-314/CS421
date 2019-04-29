N = 16;

% G is an N+2 by N+2 full matrix with border entries set to zero
G = numgrid('S',N+2); % ’S’ means square with columnwise ordering
% A is the n by n five-point Laplacian sparse matrix, where n=N^2
A = delsq(G); % "del-squared" is a common term for the Laplacian

spy(A,'bx')

L = chol(A,'lower');

hold on
spy(L,'ro')