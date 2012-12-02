function T = pdtoep(n, m, w, theta)
%PDTOEP   Symmetric positive definite Toeplitz matrix.
%         PDTOEP(N, M, W, THETA) is an N-by-N symmetric positive (semi-)
%         definite (SPD) Toeplitz matrix, comprised of the sum of M rank 2
%         (or, for certain THETA, rank 1) SPD Toeplitz matrices.
%         Specifically,
%                 T = W(1)*T(THETA(1)) + ... + W(M)*T(THETA(M)),
%         where T(THETA(k)) has (i,j) element COS(2*PI*THETA(k)*(i-j)).
%         Defaults: M = N, W = RAND(M,1), THETA = RAND(M,1).

%         Reference:
%         G. Cybenko and C.F. Van Loan, Computing the minimum eigenvalue of
%         a symmetric positive definite Toeplitz matrix, SIAM J. Sci. Stat.
%         Comput., 7 (1986), pp. 123-131.

if nargin < 2, m = n; end
if nargin < 3, w = rand(m,1); end
if nargin < 4, theta = rand(m,1); end

if max(size(w)) ~= m | max(size(theta)) ~= m
   error('Arguments W and THETA must be vectors of length M.')
end

T = zeros(n);
E = 2*pi*( (1:n)'*ones(1,n) - ones(n,1)*(1:n) );

for i=1:m
    T = T + w(i) * cos( theta(i)*E );
end
