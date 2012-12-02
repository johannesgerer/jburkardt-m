function C = comp(A, k)
%COMP    Comparison matrices.
%        COMP(A) is DIAG(B) - TRIL(B,-1) - TRIU(B,1), where B = ABS(A).
%        COMP(A, 1) is A with each diagonal element replaced by its
%        absolute value, and each off-diagonal element replaced by minus
%        the absolute value of the largest element in absolute value in
%        its row.  However, if A is triangular COMP(A, 1) is too.
%        COMP(A, 0) is the same as COMP(A).
%        COMP(A) is often denoted by M(A) in the literature.

%        Reference (e.g.):
%        N.J. Higham, A survey of condition number estimation for
%        triangular matrices, SIAM Review, 29 (1987), pp. 575-596.

if nargin == 1, k = 0; end
[m, n] = size(A);
p = min(m, n);

if k == 0

% This code uses less temporary storage than the `high level' definition above.
   C = -abs(A);
   for j=1:p
     C(j,j) = abs(A(j,j));
   end

elseif k == 1

   C = A';
   for j=1:p
       C(k,k) = 0;
   end
   mx = max(abs(C));
   C = -mx'*ones(1,n);
   for j=1:p
       C(j,j) = abs(A(j,j));
   end
   if all( A == tril(A) ), C = tril(C); end
   if all( A == triu(A) ), C = triu(C); end

end
