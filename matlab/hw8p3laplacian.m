N = 16;
for i = 1:4
    % G is an N+2 by N+2 full matrix with border entries set to zero
    G = numgrid('S',N+2); % ’S’ means square with columnwise ordering
    % A is the n by n five-point Laplacian sparse matrix, where n=N^2
    A = delsq(G); % "del-squared" is a common term for the Laplacian

    % set b to the vector of all ones
    b = ones(N^2,1);

    % call hw8p3
    [x_k,res_norms,k] = hw8p3(A,b);

    iter = 1:k-1;
    figure(i)
    semilogy(iter,res_norms)
    hold on
    title(['N = ' num2str(N)])
    xlabel('iterations')
    ylabel('residual norms')
    hold off
    
    % update N
    N = N*4;
end