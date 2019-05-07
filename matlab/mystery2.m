function [U,us,V,vs,iters] = mystery2(A,V0,tol)
[m,n] = size(A);
done = 0;
iters = 0;
k = size(V0,2);
V = V0;
while ~done
    iters = iters + 1;
    U = A*V;
    for j=1:k
        us(j) = norm(U(:,j));
        U(:,j) = U(:,j)/us(j);
    end
    V = A'*U;
    for j=1:k
        vs(j) = norm(V(:,j));
        V(:,j) = V(:,j)/vs(j);
    end
    if norm(us - vs) < tol
        done = 1;
    end
end