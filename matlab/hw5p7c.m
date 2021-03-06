function [time] = hw5p7c(n,lbw)
%
% function [time] = hw5p7c(n,p)
%
% timing of hw5p7a(A,lbw)

t1 = clock;
A = triu(randn(10*n,n),-(lbw-1));
[~,n]=size(A); p = zeros(1,n);
for k = 1:n
    % define u of length = m-k+1
    z = A(k:lbw+k-1,k);
    e1 = [1; zeros(lbw-1,1)];
    u = z+sign(z(1))*norm(z)*e1; u = u/norm(u);
    % update nonzero part of A by I-2uu^T
    A(k:lbw+k-1,k:n) = A(k:lbw+k-1,k:n)-2*u*(u'*A(k:lbw+k-1,k:n));
    % store u
    p(k) = u(1);
    A(k+1:lbw+k-1,k) = u(2:lbw);
end
t2 = clock;
time = etime(t2,t1);