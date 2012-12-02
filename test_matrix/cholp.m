function [R, P, I] = cholp(A, pivot)
%CHOLP  Cholesky factorization with pivoting of a pos. semidefinite matrix.
%       [R, P] = CHOLP(A) returns R and a permutation matrix P such that
%       R'*R = P'*A*P.  Only the upper triangular part of A is used.
%       [R, P, I] = CHOLP(A) returns in addition the index I of the last
%       positive diagonal element of R.  The first I rows of R contain
%       the Cholesky factor of A.
%       [R, I] = CHOLP(A, 0) forces P = EYE(SIZE(A)), and therefore produces
%       the same output as R = CHOL(A) when A is positive definite (to
%       within roundoff).

%       This routine is based on the LINPACK routine CCHDC.  It works
%       for both real and complex matrices.
%
%       Reference:
%       G.H. Golub and C.F. Van Loan, Matrix Computations, Second
%       Edition, Johns Hopkins University Press, Baltimore, Maryland,
%       1989, sec. 4.2.9.

if nargin == 2, piv = pivot; else piv = 1; end

[n, n] = size(A);
pp = 1:n;
I = [];

for k = 1:n

    if piv
       d = diag(A); 
       [big, m] = max( d(k:n) );
       m = m+k-1;
    else 
       big = A(k,k);  m = k;
    end
    if big <= 0, I = k-1; break, end

%   Symmetric row/column permutations.
    if m ~= k
       j = 1:k-1;
       if j
          temp = A(j,k); A(j,k) = A(j,m); A(j,m) = temp;
       end
       temp = A(k,k); A(k,k) = A(m,m); A(m,m) = temp;
       A(k,m) = conj(A(k,m));
       j = k+1:m-1;
       if j
          temp = A(k,j)'; A(k,j) = A(j,m)' ; A(j,m) = temp;
       end
       j = m+1:n;
       if j
          temp = A(k,j); A(k,j) = A(m,j); A(m,j) = temp;
       end
       pp( [k m] ) = pp( [m k] );
    end

    A(k,k) = sqrt( A(k,k) );
    if k == n, break, end
    A(k, k+1:n) = A(k, k+1:n) / A(k,k);

%   For simplicity update the whole of the remaining submatrix (rather
%   than just the upper triangle).

    j = k+1:n;
    A(j,j) = A(j,j) - A(k,j)'*A(k,j);

end  % Main k loop

R = triu(A);
if isempty(I), I = n; end
if nargout == 2 & ~piv
   P = eye(n);
elseif nargout >= 2
   P = eye(n); P = P(:,pp);
end
