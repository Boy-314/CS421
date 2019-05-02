function [x_k,res_norms,k] = hw8p5(Avmult,b)
% modified hw8p3

% Avmult = @(B,D,K,v) (v+sqrt(D)\(K\(B*(B'*(K\(sqrt(D)\v))))));
N = 256;
r = 50;
B = sprand(N^2,r,1);
D = sprand(speye(N^2));
G = numgrid('S',N+2);
K = delsq(G);
x_k = randn(N^2,1);
Av = Avmult(B,D,K,x_k);

% set tolerance to be something around machine precision
tol = 10^-8;

% initialize r_0, delta_0, b_delta, k, and p_0, and max iterations
r_k = b-Av;
delta_k = r_k'*r_k;
b_delta = b'*b;
k = 1;
p_k = r_k;
max_iter = 5000;

% conjugate gradient loop
while delta_k > tol^2*b_delta
    s_k = Avmult(B,D,K,p_k);
    alpha_k = delta_k/(p_k'*s_k);
    
    % test to make sure alpha_k is positive
    if alpha_k <= 0
        error('alpha_k is not greater than 0');
    end
    
    % compute res_norms
    res_norms(k) = delta_k^(1/2);
    
    x_k = x_k+alpha_k*p_k;
    r_k = r_k-alpha_k*s_k;
    delta_kprev = delta_k;
    delta_k = r_k'*r_k;
    p_k = r_k+(delta_k/delta_kprev)*p_k;
    
    % terminate if k > max_iter
    if k > max_iter
        break
    end
    
    k = k+1;
end

% plot
iter = 1:k-1;
figure(1)
semilogy(iter,res_norms)
hold on
title(['N = ' num2str(N)])
xlabel('iterations')
ylabel('residual norms')
hold off

x_tilde = sqrt(D)\x_k;
figure(2)
m = reshape(x_tilde,N,N);
mesh(m);

end