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
[~,~,~,Lambda] = hw9p3g(M,0.25);
% plot all the eigenvalues as complex numbers in the complex plane
lambda = diag(Lambda);
plot(real(lambda),imag(lambda),'gs'), axis equal

% plot circles
increment = 0:pi/100:2*pi;
xcoord = 0.85*cos(increment);
ycoord = 0.85*sin(increment);
plot(xcoord,ycoord,'r');
xcoord = 0.5*cos(increment);
ycoord = 0.5*sin(increment);
plot(xcoord,ycoord,'b');
xcoord = 0.25*cos(increment);
ycoord = 0.25*sin(increment);
plot(xcoord,ycoord,'g');
legend('alpha=0.85','alpha=0.5','alpha=0.25')