function [x] = hw4(load)
% homework 4 programming

% initialize Ax=b
alpha = sqrt(2)/2;
A = [alpha 0 0 -1 -alpha 0 0 0 0 0 0 0 0; 
    alpha 0 1 0 alpha 0 0 0 0 0 0 0 0; 
    0 1 0 0 0 -1 0 0 0 0 0 0 0; 
    0 0 1 0 0 0 0 0 0 0 0 0 0; 
    0 0 0 1 0 0 0 -1 0 0 0 0 0; 
    0 0 0 0 0 0 1 0 0 0 0 0 0; 
    0 0 0 0 alpha 1 0 0 -alpha -1 0 0 0; 
    0 0 0 0 alpha 0 1 0 alpha 0 0 0 0; 
    0 0 0 0 0 0 0 1 alpha 0 0 -alpha 0; 
    0 0 0 0 0 0 0 0 alpha 0 1 alpha 0; 
    0 0 0 0 0 0 0 0 0 1 0 0 -1; 
    0 0 0 0 0 0 0 0 0 0 1 0 0; 
    0 0 0 0 0 0 0 0 0 0 0 alpha 1];
b = [0 0 0 load(1) 0 0 0 load(2) 0 0 0 load(3) 0]';
x = A\b;

% plot the graph
clf
hold on
x_coords = [0 1; 0 1; 1 1; 1 2; 1 2; 1 2; 2 2; 2 3; 2 3; 2 3; 3 3; 3 4; 3 4];
y_coords = [0 1; 0 0; 0 1; 1 1; 1 0; 0 0; 0 1; 1 1; 0 1; 0 0; 0 1; 1 0; 0 0];
for i = 1:13
    if x(i) == 0
        plot(x_coords(i,:),y_coords(i,:),'k:')
    end
    if x(i) < 0
        plot(x_coords(i,:),y_coords(i,:),'b','LineWidth',-x(i)/2)
    end
    if x(i) > 0
        plot(x_coords(i,:),y_coords(i,:),'r','LineWidth',x(i)/2)
    end
end

end

