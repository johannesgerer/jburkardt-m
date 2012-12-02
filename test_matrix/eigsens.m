function [X, D, s] = eigsens(A)
%EIGSENS   Eigenvalue condition numbers.
%          EIGSENS(A) is a vector of condition numbers for the eigenvalues
%          of A (reciprocals of the Wilkinson s(lambda) numbers).
%          These condition numbers are the reciprocals of the cosines of the
%          angles between the left and right eigenvectors.
%          [V, D, s] = EIGSENS(A) is equivalent to
%                      [V, D] = EIG(A); s = EIGSENS(A);

%          Reference:
%          G.H. Golub and C.F. Van Loan, Matrix Computations, Second
%          Edition, Johns Hopkins University Press, Baltimore, Maryland,
%          1989, sec. 7.2.2.

n = max(size(A));
s = zeros(n,1);

[X, D] = eig(A);
Y = inv(X);

for i=1:n
    s(i) = norm(Y(i,:)) * norm(X(:,i)) / abs( Y(i,:)*X(:,i) );
end

if nargout <= 1, X = s; end
