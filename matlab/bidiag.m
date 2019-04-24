function [U,B,V] = bidiag(A)
% calls housesvd and uses its output to explicitly produce matrices U, B,
% and V, where A = UBV', with U'U = I_m, V'V = I_n, and B bidiagonal as in
% the left side of Fig 8.8 (ignore the right side which is not relevant to
% this assignment). Generate U and V by multiplying the Householder
% transformations onto the appropriate identity matrix, just as you did for
% myqr.

% initialize outputs and size variables
[m,n] = size(A);
U = eye(m);
V = eye(n);

% call housesvd
[A,u,v] = housesvd(A);

% compute U
for k = n:-1:1
   u_left = [u(k);A(k+1:m,k)];
   U(k:m,:) = U(k:m,:)-2*u_left*(u_left'*U(k:m,:));
end

% compute V
for k = 1:n-2
    u_right = [v(k),A(k,k+2:n)]';
    V(k:n,k+1:n) = V(k:n,k+1:n)-2*(V(k:n,k+1:n)*u_right)*u_right';
end

% compute B
B = [diag(diag(A)) + [zeros(n-1,1), diag(diag(A,1)); zeros(1,n)]; zeros(1,n)];
end

