% create the matrix and semilogy graph
clf
N = 16;
G = numgrid('S',N+2);
A = delsq(G);
b = ones(256,1);
[x,res_norms] = hw8p2(A,b);
semilogy(res_norms)
hold on

% create points K,...,100 along the x-axis
K = 20;
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
theta = 10^gamma;

% plot
k = 1:100;
plot(k,beta+gamma*(k-K))
