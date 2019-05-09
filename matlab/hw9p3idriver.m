% compute A, and run hw9p3i
[A,~,~,Lambda] = hw9p3g(M,0.85);
[v,residuals,count] = hw9p3i(A,0.85);
figure(1)
plot((count-6):(count-1),residuals((count-6):(count-1)));
% compare to eig
lambda = diag(Lambda);
sort(lambda,'descend');
lambda(2)

% repeat for alpha=0.5,0.25

[A,~,~,Lambda] = hw9p3g(M,0.5);
[v,residuals,count] = hw9p3i(A,0.5);
figure(2)
plot((count-6):(count-1),residuals((count-6):(count-1)));
% compare to eig
lambda = diag(Lambda);
sort(lambda,'descend');
lambda(2)

[A,~,~,Lambda] = hw9p3g(M,0.25);
[v,residuals,count] = hw9p3i(A,0.25);
figure(3)
plot((count-6):(count-1),residuals((count-6):(count-1)));
% compare to eig
lambda = diag(Lambda);
sort(lambda,'descend');
lambda(2)