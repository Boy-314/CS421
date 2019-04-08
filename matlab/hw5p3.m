function [A,p] = hw5p3(A)
%hw5 problem 3, a revision of the house function given in A&G page 161
[m,n] = size(A); p = zeros(1,n);
for k = 1:n
    % define u of length = m-k+1
    z = A(k:m,k);
    e1 = [1; zeros(m-k,1)];
    u = z+sign(z(1))*norm(z)*e1; u = u/norm(u);
    % update nonzero part of A by I-2uu^T
    % excluding the diagonal entries which are stored explicitly below
    A(k:m,k+1:n) = A(k:m,k+1:n)-2*u*(u'*A(k:m,k+1:n));
    % store u, and the diagonal
    p(k) = u(1);
    A(k,k) = -sign(z(1))*norm(z);
    A(k+1:m,k) = u(2:m-k+1);
end

