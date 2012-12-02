function [Q, R] = cgs(A)
%CGS     Classical Gram-Schmidt QR factorization.
%        [Q, R] = cgs(A) uses the classical Gram-Schmidt method to compute the
%        factorization A = Q*R for m-by-n A of full rank,
%        where Q is m-by-n with orthonormal columns and R is n-by-n.

[m, n] = size(A);
Q = zeros(m,n);
R = zeros(n);

% Gram-Schmidt expressed in matrix-vector form.
% Treat j = 1 as special case to avoid if tests inside loop.
R(1,1) = norm(A(:,1));
Q(:,1) = A(:,1)/R(1,1);
for j=2:n
    R(1:j-1,j) = Q(:,1:j-1)'*A(:,j);
    temp = A(:,j) - Q(:,1:j-1)*R(1:j-1,j);
    R(j,j) = norm(temp);
    Q(:,j) = temp/R(j,j);
end
