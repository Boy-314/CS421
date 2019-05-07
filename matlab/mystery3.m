function [U,UR,V,VR,iters] = mystery3(A,V0,tol)
[m,n] = size(A);
done = 0;
iters = 0;
V = V0;
while ~done
    iters = iters + 1;
    U = A*V;
    [U,UR] = qr(U,0);
    V = A'*U;
    [V,VR] = qr(V,0);
    if norm(UR - VR) < tol
        done = 1;
    end
end