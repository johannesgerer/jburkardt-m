function P = pei(n, alpha)
%PEI    Pei matrix.
%       PEI(N, ALPHA), where ALPHA is a scalar, is the symmetric matrix
%       ALPHA*EYE(N) + ONES(N).
%       If ALPHA is omitted then ALPHA = 1 is used.
%       The matrix is singular for ALPHA = 0, -N.

%       Reference:
%       M.L. Pei, A test matrix for inversion procedures,
%       Comm. ACM, 5 (1962), p. 508.

if nargin == 1, alpha = 1; end

P = alpha*eye(n) + ones(n);
