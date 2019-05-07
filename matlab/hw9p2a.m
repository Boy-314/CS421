% setup
A = imread('WallOfWindows.jpg','jpg');
figure(1);
image(A)
whos A
A_red = double(A(:,:,1));
A_green = double(A(:,:,2));
A_blue = double(A(:,:,3));
[m,n] = size(A_red);

% part a
[U_red, S_red, V_red] = svd(A_red,0);
[U_green, S_green, V_green] = svd(A_green,0);
[U_blue, S_blue, V_blue] = svd(A_blue,0);

% r_vals = [10 20 30 100];
r_vals = [10 20];
iter = 2;
for k = r_vals
    nearestr_red = zeros(m,n);
    nearestr_green = zeros(m,n);
    nearestr_blue = zeros(m,n);
    for i = 1:k
        nearestr_red = nearestr_red + S_red(i)*U_red(i)*V_red(i)';
        nearestr_green = nearestr_green + S_green(i)*U_green(i)*V_green(i)';
        nearestr_blue = nearestr_blue + S_blue(i)*U_blue(i)*V_blue(i)';
    end
    recombine = nearestr_red;
    recombine(:,:,2) = nearestr_green;
    recombine(:,:,3) = nearestr_blue;
    
    figure(iter)
    iter = iter + 1;
    image(recombine)
end