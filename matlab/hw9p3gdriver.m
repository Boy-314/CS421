% call hw9p3g.m
[~,~,~,Lambda] = hw9p3g(M,0.85);

% plot all the eigenvalues as complex numbers in the complex plane
lambda = diag(Lambda);
plot(real(lambda),imag(lambda),'rx'), axis equal

% repeat for alpha = 0.5, 0.25
hold on

% call hw9p3g.m
[~,~,~,Lambda] = hw9p3g(M,0.5);

% plot all the eigenvalues as complex numbers in the complex plane
lambda = diag(Lambda);
plot(real(lambda),imag(lambda),'bo'), axis equal

% call hw9p3g.m
[~,~,~,Lambda] = hw9p3g(M,0.85);

% plot all the eigenvalues as complex numbers in the complex plane
lambda = diag(Lambda);
plot(real(lambda),imag(lambda),'gs'), axis equal