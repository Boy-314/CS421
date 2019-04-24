function [A,u,v] = housesvd(A)
% reduces an m by n rectangular matrix A to bidiagonal form using
% householder reflectors, applying different reflectors on the left and
% right of A, and storing the Householder reflector information in the
% lower and upper triangles of explicit zeros (you will also need to output
% two extra vectors, say u and v, to store the first component of each
% Householder reflector)

[m,n] = size(A);
u = zeros(1,n);
v = zeros(1,n-2);

for k = 1:n    
    % apply left transformation
    z_left = A(k:m,k);
    e1_left = [1; zeros(m-k,1)];
    u_left = z_left+sign(z_left(1))*norm(z_left)*e1_left; u_left = u_left/norm(u_left);
    A(k:m,k:n) = A(k:m,k:n)-2*u_left*(u_left'*A(k:m,k:n));
    
    % apply right transformation
    if k+2 <= n
        z_right = A(k,k+1:n)';
        e1_right = [1; zeros(n-k-1,1)];
        u_right = z_right+sign(z_right(1))*norm(z_right)*e1_right; u_right = u_right/norm(u_right);
        A(k:m,k+1:n) = A(k:m,k+1:n)-2*(A(k:m,k+1:n)*u_right)*u_right';
    end
    
    % store u
    u(k) = u_left(1);
    A(k+1:m,k) = u_left(2:m-k+1);
    
    % store v
    if k+2 <= n
        v(k) = u_right(1);
        A(k,k+2:n) = u_right(2:n-k);
    end
end
end

