function [A,x] = hw4p5(k)
% generalized function for creating k length long trusses

% calculate dimensions of the matrix: dimension = 8 * (k-1) + 13
d = 8 * (k-1) + 13;

% a = sin(pi/4)
alpha = sqrt(2)/2;

% initialize Ax=b
A = sparse(d,d);
x = zeros(d,1);
b = zeros(d,1);

% create the first 4 force equations for the first two points A, B
% A horizontal: lines 20-22
% A vertical: lines 23-25
% B horizontal: lines 26-27
% A vertical: line 28
A(1,1) = alpha;
A(1,4) = -1;
A(1,5) = -alpha;
A(2,1) = alpha;
A(2,3) = 1;
A(2,5) = alpha;
A(3,2) = 1;
A(3,6) = -1;
A(4,3) = 1;

% create last 5 force equations
% create the last force equation for G^k
A(d,d) = 1;
A(d,d-1) = alpha;

% create 2nd, 3rd, 4th, 5th to last force equations for E,F
% E horizontal: lines 40-42
% E vertical: lines 43-45
% F horizontal: lines 46-47
% F vertical: line 48
A(d-4,d-5) = 1;
A(d-4,d-4) = alpha;
A(d-4,d-1) = -alpha;
A(d-3,d-4) = alpha;
A(d-3,d-2) = 1;
A(d-3,d-1) = alpha;
A(d-2,d-3) = 1;
A(d-2,d) = -1;
A(d-1,d-2) = 1;

% create force equations for the rest of the inner points

% equations for points equivalent to C
% horizontal equations
for i = 5:8:(d-8)
    A(i,i-1) = 1;
    A(i,i+3) = -1;
end
% vertical equations
for i = 6:8:(d-7)
    A(i,i+1) = 1;
end

% equations for points equivalent to D
% horizontal equations
for i = 7:8:(d-6)
    A(i,i-2) = alpha;
    A(i,i-1) = 1;
    A(i,i+2) = -alpha;
    A(i,i+3) = -1;
end
% vertical equations
for i = 8:8:(d-5)
    A(i,i-3) = alpha;
    A(i,i-1) = 1;
    A(i,i+1) = alpha;
end

% equations for points equivalent to E,A' and F,B'
% (these do not exist in the case where k=1)
if k ~= 1
    % E,A'
    % horizontal equations
    for i = 9:8:(d-12)
        A(i,i-1) = 1;
        A(i,i) = alpha;
        A(i,i+3) = -1;
        A(i,i+4) = -alpha;
    end
    % vertical equations
    for i = 10:8:(d-11)
        A(i,i-2) = alpha;
        A(i,i+1) = 1;
        A(i,i+3) = alpha;
    end
    
    % F,B'
    % horizontal equations
    for i = 11:8:(d-10)
        A(i,i-1) = 1;
        A(i,i+3) = -1;
    end
    % vertical equations
    for i = 12:8:(d-9)
        A(i,i-1) = 1;
    end
end

% create load vector b
increment = 10;
for i = 4:4:(d-1)
    b(i,1) = increment;
    increment = increment + 10;
end

x = A\b;

end

