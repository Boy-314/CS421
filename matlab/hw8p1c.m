N = 16;

% G is an N+2 by N+2 full matrix with border entries set to zero
G = numgrid('S',N+2); % ’S’ means square with columnwise ordering
% A is the n by n five-point Laplacian sparse matrix, where n=N^2
A = delsq(G); % "del-squared" is a common term for the Laplacian

% N by N matrix of the given N^2 eigenvalues
lambda = zeros(N,N);
h = 1/(N+1);
% compute eigenvalues with formula
for l = 1:N
    for m = 1:N
        lambda(l,m) = 4-2*(cos(l*pi*h)+cos(m*pi*h));
    end
end

% reshape, sort, and plot
n = N^2;
eigvalues = reshape(lambda,n,1);
eigvalues = sort(eigvalues);
plot(eigvalues,'*')

hold on

% compute via MATLAB eig
lambda_2 = eig(full(A));
plot(lambda_2,'ro')