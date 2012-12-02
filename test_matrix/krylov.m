function B = krylov(A, x, j)
%KRYLOV    Krylov matrix.
%          KRYLOV(A, x, j) is the Krylov matrix
%               [x, Ax, A^2x, ..., A^(j-1)x],
%          where A is an n-by-n matrix and x is an n-vector.
%          Defaults: x = ONES(n,1), j = n.
%          KRYLOV(n) is the same as KRYLOV(RANDN(n)).

%          Reference:
%          G.H. Golub and C.F. Van Loan, Matrix Computations, second edition,
%          Johns Hopkins University Press, Baltimore, Maryland, 1989, p. 369.

[n, n] = size(A);

if n == 1   % Handle special case A = scalar.
   n = A;
   A = randn(n);
end

if nargin < 3, j = n; end
if nargin < 2, x = ones(n,1); end


B = ones(n,j);
B(:,1) = x(:);
for i=2:j
    B(:,i) = A*B(:,i-1);
end
