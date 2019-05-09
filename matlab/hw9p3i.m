function [v,residuals,count] = hw9p3i(A,alpha)
% implements the power method for computing the desired page rank vector x,
% which requires matrix-vector products using the formula for G
% use initial vector (1/n)e

done = false;
[n,~] = size(A);
tol = 10^-15;
e = ones(n,1);
v = (1/n)*e;

count = 1;
while ~done
    v_new = alpha*A*v+(1-alpha)*1/n*(e'*v)*e;
    
    % termination condition
    mu = norm(v_new-v,1);
    residuals(count) = mu;
    if mu < tol
        done = true;
    end
    
    % update v
    v = v_new;
    count = count+1;
end

end