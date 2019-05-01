function [x_k,res_norms,k] = hw8p3(A,b)
% implements the conjugate gradient method. includes a max iteration count
% to make sure there are no infinite loops. tests to make sure alpha_k is
% positive, terminates with an error if it is not

[~,n] = size(A);

% randomly generate initial guess x_0
x_k = randn(n,1);

% set tolerance to be something around machine precision
tol = 10^-8;

% initialize r_0, delta_0, b_delta, k, and p_0, and max iterations
r_k = b-A*x_k;
delta_k = r_k'*r_k;
b_delta = b'*b;
k = 1;
p_k = r_k;
max_iter = 5000;

% conjugate gradient loop
while delta_k > tol^2*b_delta
    s_k = A*p_k;
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
end