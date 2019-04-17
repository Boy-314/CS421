function [A,x,p,condA] = hw6polyInterpOrApprox (t,b,deg,nPlot,wantPlot,alg)
% generates polynomial approximation
% wantPlot is set to 0 to suppress plot output
% alg is the method for solving
%   1. backslash
%   2. normal equations
%   3. normal equations with cholesky
%   4. qr factorization
%   5. reduced qr factorization
%   6. svd

% error handling for if t and b are of different length
if length (t) ~= length (b)
    error ('t and b are not the same length ')
end
m = length(t);

% error handling if m < deg + 1
if m < (deg + 1)
    error ('not enough information to determine polynomial of degree deg ')
end

% create A matrix
A = zeros (m, deg + 1);
[~,n] = size(A);

% fill in the A matrix
powers = 0: deg;
for j = 1:( deg + 1)
    A(:,j) = t.^ powers (j);
end

%   1. backslash
%   2. normal equations
%   3. normal equations with cholesky
%   4. qr factorization
%   5. reduced qr factorization
%   6. svd
switch alg
    case 1
        x = A \ b;
    case 2
        x = (A' * A) \ (A' * b);
    case 3
        B = A' * A;
        y = A' * b;
        G = chol(B,'lower');
        z = G \ y;
        x = G' \ z;
    case 4
        [AA,pHat] = house(A);
        [x,~] = lsol(b,AA,pHat);
    case 5
        [Q,R] = qr(A,0);
        c = Q' * b;
        x = R \ c;
    case 6
        [U,S,V] = svd(A);
        z = U' * b;
        y = zeros(n,1);
        for i = 1:n
            y(i) = z(i)/S(i,i);
        end
        x = V * y;
        condA = S(1) / S(n);
end

% compute p
tt = linspace (t(1) , t(m), nPlot);
p = 0;
for i = 1:( deg + 1)
    p = p + x(i).* tt .^(i -1);
end

% plot
if wantPlot ~= 0
    plot (tt ,p)
    hold on
    plot (t',b','ro','LineWidth' ,2)
end
end