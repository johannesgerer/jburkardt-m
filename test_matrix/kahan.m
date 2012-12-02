function U = kahan(n, theta, pert)
%KAHAN  Kahan matrix - upper trapezoidal.
%       KAHAN(N, THETA) is an upper trapezoidal matrix
%       that has some interesting properties regarding estimation of
%       condition and rank.
%       The matrix is N-by-N unless N is a 2-vector, in which case it
%       is N(1)-by-N(2).
%       The parameter THETA defaults to 1.2.
%       The useful range of THETA is 0 < THETA < PI.
%
%       To ensure that the QR factorization with column pivoting does not
%       interchange columns in the presence of rounding errors, the diagonal
%       is perturbed by PERT*EPS*diag( [N:-1:1] ).
%       The default is PERT = 25, which ensures no interchanges for KAHAN(N)
%       up to at least N = 90 in IEEE arithmetic.
%       KAHAN(N, THETA, PERT) uses the given value of PERT.

%       The inverse of KAHAN(N, THETA) is known explicitly: see
%       Higham (1987, p. 588), for example.
%       The diagonal perturbation was suggested by Christian Bischof.
%
%       References:
%       W. Kahan, Numerical linear algebra, Canadian Math. Bulletin,
%          9 (1966), pp. 757-801.
%       N.J. Higham, A survey of condition number estimation for
%          triangular matrices, SIAM Review, 29 (1987), pp. 575-596.

if nargin < 3, pert = 25; end
if nargin < 2, theta = 1.2; end

r = n(1);              % Parameter n specifies dimension: r-by-n.
n = n(max(size(n)));

s = sin(theta);
c = cos(theta);

U = eye(n) - c*triu(ones(n), 1);
U = diag(s.^[0:n-1])*U + pert*eps*diag( [n:-1:1] );
if r > n
   U(r,n) = 0;         % Extend to an r-by-n matrix.
else
   U = U(1:r,:);       % Reduce to an r-by-n matrix.
end
