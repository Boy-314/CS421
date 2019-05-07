function [u,us,v,vs,iters] = mystery1(A,v0,tol)
%
[m,n] = size(A);
done = 0;
iters = 0;
v = v0;
while ~done
    iters = iters + 1;
    u = A*v;
    us = norm(u);
    u = u/us;
    v = A'*u;
    vs = norm(v);
    v = v/vs;
    if abs(us - vs) < tol
        done = 1;
    end
end