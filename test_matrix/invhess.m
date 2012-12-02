function A = invhess(x, y)
%INVHESS  Inverse of an upper Hessenberg matrix.
%         INVHESS(X, Y), where X is an N-vector and Y an N-1 vector,
%         is the matrix whose lower triangle agrees with that of
%         ONES(N,1)*X' and whose strict upper triangle agrees with
%         that of [1 Y]*ONES(1,N).
%         The matrix is nonsingular if X(1) ~= 0 and X(i+1) ~= Y(i)
%         for all i, and its inverse is an upper Hessenberg matrix.
%         If Y is omitted it defaults to -X(1:N-1).
%         Special case: if X is a scalar INVHESS(X) is the same as
%         INVHESS(1:X).

%         References:
%         F.N. Valvi and V.S. Geroyannis, Analytic inverses and
%             determinants for a class of matrices, IMA Journal of Numerical
%             Analysis, 7 (1987), pp. 123-128.
%         W.-L. Cao and W.J. Stewart, A note on inverses of Hessenberg-like
%             matrices, Linear Algebra and Appl., 76 (1986), pp. 233-240.
%         Y. Ikebe, On inverses of Hessenberg matrices, Linear Algebra and
%             Appl., 24 (1979), pp. 93-97.
%         P. Rozsa, On the inverse of band matrices, Integral Equations and
%             Operator Theory, 10 (1987), pp. 82-95.

n = max(size(x));
%  Handle scalar x.
if n == 1
   n = x;
   x = 1:n;
end
x = x(:);

if nargin < 2, y = -x; end
y = y(:);

% On next line, z = x'; A = z(ones(n,1),:) would be more efficient.
A = ones(n,1)*x';  
for j=2:n
    A(1:j-1,j) = y(1:j-1);
end
