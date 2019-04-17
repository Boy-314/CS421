clf;
% create the unit circle
interval = linspace(0,2*pi,1000);
s = sin(interval);
c = cos(interval);
% plot unit circle
plot(s,c,'b');
hold on;
axis equal;

% generate A
A = randn(2);

% multiply random A onto vectors
vectors = [s; c];
for i = 1:1000
    vectors(:,i) = A*vectors(:,i);
end
% plot transformed ellipse
plot(vectors(1,:),vectors(2,:),'g');

% compute svd
[U,S,V] = svd(A);
% plot v_1,v_2
origin = zeros(2,1);
v1 = V(:,1);
v2 = V(:,2);
plot([0 v1(1)],[0 v1(2)],'r');
plot([0 v2(1)],[0 v2(2)],'r');
% plot sigma_1*u_1, sigma_2*u_2
s1u1 = S(1,1)*U(:,1);
s2u2 = S(2,2)*U(:,2);
plot([0 s1u1(1)],[0 s1u1(2)],'c');
plot([0 s2u2(1)],[0 s2u2(2)],'c');
legend('unit circle','hyper-ellipse','v1','v2','\sigma1u1','\sigma2u2')