N = 16;
N_axis = [16,32,64,128,256,512,1024];
condition = zeros(7,1);
counter = 1;
while N <= 1024
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
    
    % put eigenvalues into a vector, and sort
    n = N^2;
    eigvalues = reshape(lambda,n,1);
    eigvalues = sort(eigvalues);
    
    % compute condition number from eigenvalues
    condition(counter) = abs(eigvalues(n))/abs(eigvalues(1));
    
    counter = counter+1;
    N = 2*N;
end

plot(N_axis,condition)
xlabel('N')
ylabel('condition number')