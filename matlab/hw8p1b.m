N = 16;

% G is an N+2 by N+2 full matrix with border entries set to zero
G = numgrid('S',N+2); % ’S’ means square with columnwise ordering
% A is the n by n five-point Laplacian sparse matrix, where n=N^2
A = delsq(G); % "del-squared" is a common term for the Laplacian

n = N^2;
b = ones(n,1);

% solve Ax=b with chol
R = chol(A);
y = R' \ b;
x = R \ y;
u = reshape(x,N,N);
mesh(u)