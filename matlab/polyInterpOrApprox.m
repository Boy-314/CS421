function [A,x,p] = polyInterpOrApprox(t,b,deg,nPlot)
% error handling for if t and b are of different length
if length(t) ~= length(b)
    error('t and b are not the same length')
end

m = length(t);

% error handling if m < deg + 1
if m < (deg + 1)
    error('not enough information to determine polynomial of degree deg')
end

% create A matrix
A = zeros(m, deg + 1);

% fill in the A matrix
powers = 0:deg;
for j = 1:(deg + 1)
    A(:,j) = t.^powers(j);
end

% if A is square, solve Ax=b
% if A is rectangular, solve linear least squares problem
x = A \ b;

% compute p
tt = linspace(t(1), t(m), nPlot);
p = 0;
for i = 1:(deg + 1)
    p = p + x(i).*tt.^(i-1);
end

% plot
plot(tt,p)
hold on
plot(t',b','ro','LineWidth',2)

end
