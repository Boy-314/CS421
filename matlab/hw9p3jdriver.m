% call hw9p3i for power method
[v,residuals,count] = hw9p3i(A,0.85);
figure(1)
plot((count-6):(count-1),residuals((count-6):(count-1)));
[xsort,index] = sort(v,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))

% repeat for alpha=0.5,0.25

% call hw9p3i for power method
[v,residuals,count] = hw9p3i(A,0.5);
figure(2)
plot((count-6):(count-1),residuals((count-6):(count-1)));
[xsort,index] = sort(v,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))

% call hw9p3i for power method
[v,residuals,count] = hw9p3i(A,0.25);
figure(3)
plot((count-6):(count-1),residuals((count-6):(count-1)));
[xsort,index] = sort(v,'descend');
% print largest components along with the corresponding URL names
url(index(1:10))