function C = cauchy(x, y)
%CAUCHY  Cauchy matrix.
%        C = CAUCHY(X, Y), where X, Y are N-vectors, is the N-by-N matrix
%        with C(i,j) = 1/(X(i)+Y(j)).   By default, Y = X.
%        Special case: if X is a scalar CAUCHY(X) is the same as CAUCHY(1:X).
%        Explicit formulas are known for DET(C) (which is nonzero if X and Y
%        both have distinct elements) and the elements of INV(C).
%        C is totally positive if 0 < X(1) < ... < X(N) and
%        0 < Y(1) < ... < Y(N).

%        References:
%        N.J. Higham, Accuracy and Stability of Numerical Algorithms,
%           Society for Industrial and Applied Mathematics, Philadelphia, PA,
%           USA, 1996; sec. 26.1.
%        D.E. Knuth, The Art of Computer Programming, Volume 1,
%           Fundamental Algorithms, second edition, Addison-Wesley, Reading,
%           Massachusetts, 1973, p. 36.
%        E.E. Tyrtyshnikov, Cauchy-Toeplitz matrices and some applications,
%           Linear Algebra and Appl., 149 (1991), pp. 1-18.
%        O. Taussky and M. Marcus, Eigenvalues of finite matrices, in
%           Survey of Numerical Analysis, J. Todd, ed., McGraw-Hill, New York,
%           pp. 279-313, 1962. (States the totally positive property on p. 295.)

n = max(size(x));
%  Handle scalar x.
if n == 1
   n = x;
   x = 1:n;
end

if nargin == 1, y = x; end

x = x(:); y = y(:);   % Ensure x and y are column vectors.
if any(size(x) ~= size(y))
   error('Parameter vectors must be of same dimension.')
end

C = x*ones(1,n) + ones(n,1)*y.';
C = ones(n) ./ C;
