function [A,G,X,Lambda] = hw9p3g(M,alpha)
% input is the adjacency matrix M as a sparse matrix, and the damping
% parameter alpha, that computes the matrices A and G and the eigenvalues
% of G using eig.

% get size of M
[n,~] = size(M);

% initialize A
A = zeros(n);

% compute A
for j = 1:n
    for i = 1:n
        % compute Nj
        Nj = sum(M(:,j));
        % if Nj > 0, set A_ij = 1/Nj if M_ij = 1, 0 otherwise
        if Nj > 0
            if M(i,j) == 1
                A(i,j) = 1/Nj;
            else
                A(i,j) = 0;
            end
        elseif Nj == 0 % if Nj = 0, set A_ij = 1/n for i=1:n
            A(:,j) = 1/n;
            break;
        end
    end
end

% compute G
e = ones(n,1);
G = alpha*A+(1-alpha)*1/n*(e*e');

% compute eigenvalues of G
[X,Lambda] = eig(G);

end

