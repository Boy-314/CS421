function [lambdak] = powerBTB(B,tau)
% approximately computes the lagest eigenvalue of B^T*B without forming the
% product B^T*B explicitly: instead, compute B^T(Bv) once each time the
% loop is executed by calling Bx and BTy. Use a randomly generated starting
% vector v in R^n. Terminate the loop when |lambda_1^k-lambda_1^{k-1}|<tau,
% where tau is a stopping tolerance that you provide to the function (also 
% provide a maximum iteration limit to avoid infinite loops).

% initialize size variables, and B'
[~,n] = size(B);
BT = B';

% create random vector v
v0 = randn(1,n);

% set lambdas, and BTBvk/v_tilde
lambdak = 0;
lambdaprev = 0;
v_tilde = BTy(BT,Bx(B,v0));

% power method
k = 1;
while true
    % compute v_k = v_tilde/||v_tilde||
    vk = v_tilde/norm(v_tilde);
    
    % compute BTBvk with Bx and BTy
    BTBvk = BTy(BT,Bx(B,vk));
    
    % compute lambda
    lambdak = vk'*BTBvk;
    
    % check for termination
    if abs(lambdak-lambdaprev) < tau
        break
    end
    if k == 1000000
        break
    end
    
    % update lambdaprev, v_tilde, and k
    lambdaprev = lambdak;
    v_tilde = BTBvk;
    k = k+1;
end

end

