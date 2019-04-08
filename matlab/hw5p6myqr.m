function [Q,R] = hw5p6myqr(A,~)
% myqr: same basic syntax as MATLAB's qr, [Q,R]=myqr(A) returns
% the full Q,R factors, [Qhat,Rhat]=myqr(A,0) returns the
% economy sized Qhat,Rhat factors

% get dimensions m and n
[m,n] = size(A);

% create m by m identity matrix
I = eye(m);
%Ihat = eye(m,n);

% initialize outputs
Q = I;
Qhat = eye(m,n);
R = A;

% householder reflections
% changed house(A) to hw5p6house(A)
[A,p] = hw5p6house(A);

% handle user input
switch nargin
    % full Q,R factors
    case 1
        % compute Q=P1*P2*P3*...*Pn-1*Pn*I
        for k = n:-1:1
            u = [p(k);A(k+1:m,k)];
            Q(k:m,:) = Q(k:m,:)-2*u*(u'*Q(k:m,:));
        end

        % compute R
        for k = 1:n
            u = [p(k);A(k+1:m,k)];
            R(k:m,k:n) = R(k:m,k:n)-2*u*(u'*R(k:m,k:n));
            % set everything under the upper triangular matrix to be zero
            R(k+1:m,k) = zeros(m-k,1);
        end
        
    % economy size Qhat,Rhat factors
    case 2
        % set Q = Qhat
        Q = Qhat;
        
        % compute Qhat=P1*P2*P3*...*Pn-1*Pn*Ihat
        for k = n:-1:1
            u = [p(k);A(k+1:m,k)];
            Q(k:m,:) = Q(k:m,:)-2*u*(u'*Q(k:m,:));
        end
        
        % compute R
        for k = 1:n
            u = [p(k);A(k+1:m,k)];
            R(k:m,k:n) = R(k:m,k:n)-2*u*(u'*R(k:m,k:n));
            % set everything under the upper triangular matrix to be zero
            R(k+1:m,k) = zeros(m-k,1);
        end
        % truncate R
        R = R(1:n,:);
end

end

