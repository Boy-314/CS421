function [x,res_norms] = hw8p2(A,b)
% implements gradient descent to solve Ax=b for large A. takes input A and
% b, and returns output x and a vector of all the computed residual norms

% initialize tolerance tol, max iterations, and initial x guess
tol = 10e-16;
max_iter = 100;
[~,n] = size(A);
x_k = randn(n,1);

% loop
k = 1;
while k <= max_iter
    r_k = b-A*x_k;
    alpha_k = (r_k'*r_k)/(r_k'*A*r_k);
    x_k = x_k+alpha_k*r_k;
    
    % put residuals into output vector
    res_norms(k) = norm(r_k);
    
    % quit if alpha_k is NOT positive
    if alpha_k <= 0
        error('alpha_k is not greater than 0');
    end
    
    % terminate when ||r_k|| is smaller than tolerance
    if norm(r_k) < tol
        break
    end
    
    % iterate
    k = k+1;
end

x = x_k;

end

