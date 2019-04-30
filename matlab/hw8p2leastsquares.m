% create the matrix and semilogy graph
clf
N = 16;

% iterate N = 16,64,256
while N <= 256
    G = numgrid('S',N+2);
    A = delsq(G);
    b = ones(N^2,1);
    [x,res_norms] = hw8p2(A,b);
    semilogy(res_norms)
    hold on

    % create points K,...,100 along the x-axis
    K = 50;
    t = K:100;

    % set b to be the res_norms vector at their respective indices
    b = res_norms(K:100)';

    % call polyInterpOrApprox to plot the least squares approximation
    deg = 1;
    nPlot = 100-K;
    [~,coeff,~] = polyInterpOrApprox(t,b,deg,nPlot); % store coefficients

    % set beta, gamma, and theta
    beta = coeff(1);
    gamma = coeff(2);
    theta = 10^gamma

    % plot
    k = K:100+K;
    plot(k-K,beta+gamma*(k-K))
    
    % update N
    N = N*4;
end
