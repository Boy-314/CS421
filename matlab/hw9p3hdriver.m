% call hw9p3g.m
[~,~,X,Lambda] = hw9p3g(M,0.85);
% compute x, normalize, and ensure its positive
[~,i] = max(max(Lambda));
x = X(:,i)/norm(X(:,i),1);
if x(1) < 0
    x = -x;
end
% sort components of x
[xsort,index] = sort(x,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))

% repeat for alpha = 0.5, 0.25

% 0.5
[~,~,X,~] = hw9p3g(M,0.5);
% compute x, normalize, and ensure its positive
[~,i] = max(max(Lambda));
x = X(:,i)/norm(X(:,i),1);
if x(1) < 0
    x = -x;
end
% sort components of x
[xsort,index] = sort(x,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))

% 0.25
[~,~,X,Lambda] = hw9p3g(M,0.25);
% compute x, normalize, and ensure its positive
[~,i] = max(max(Lambda));
x = X(:,i)/norm(X(:,i),1);
if x(1) < 0
    x = -x;
end
% sort components of x
[xsort,index] = sort(x,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))