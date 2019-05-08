% setup
A = imread('WallOfWindows.jpg','jpg');
figure(1);
image(A)
whos A
A_red = double(A(:,:,1));
A_green = double(A(:,:,2));
A_blue = double(A(:,:,3));
[m,n] = size(A_red);

% part b
tol = 1000;

r_vals = [10 20 30 100];
iter = 1;
for k = r_vals
    V0 = randn(n,k);
    [U_red, S_red, V_red, ~, ~] = mystery3(A_red,V0,tol);
    [U_green, S_green, V_green, ~, ~] = mystery3(A_green,V0,tol);
    [U_blue, S_blue, V_blue, ~, ~] = mystery3(A_blue,V0,tol);
    nearestr_red = zeros(m,n);
    nearestr_green = zeros(m,n);
    nearestr_blue = zeros(m,n);
    for i = 1:k
        nearestr_red = nearestr_red + S_red(i,i)*U_red(:,i)*V_red(:,i)';
        nearestr_green = nearestr_green + S_green(i,i)*U_green(:,i)*V_green(:,i)';
        nearestr_blue = nearestr_blue + S_blue(i,i)*U_blue(:,i)*V_blue(:,i)';
    end
    recombine = uint8(nearestr_red);
    recombine(:,:,2) = uint8(nearestr_green);
    recombine(:,:,3) = uint8(nearestr_blue);
    
    figure(iter + 1)
    iter = iter + 1;
    image(recombine)
end