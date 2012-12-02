function A = smoke(n, k)
%SMOKE     Smoke matrix - complex, with a `smoke ring' pseudospectrum.
%          SMOKE(N) is an N-by-N matrix with 1s on the
%          superdiagonal, 1 in the (N,1) position, and powers of
%          roots of unity along the diagonal.
%          SMOKE(N, 1) is the same except for a zero (N,1) element.
%          The eigenvalues of SMOKE(N, 1) are the N'th roots of unity;
%          those of SMOKE(N) are the N'th roots of unity times 2^(1/N).
%
%          Try PS(SMOKE(32)).  For SMOKE(N, 1) the pseudospectrum looks
%          like a sausage folded back on itself.
%          GERSH(SMOKE(N, 1)) is interesting.

%          Reference:
%          L. Reichel and L.N. Trefethen, Eigenvalues and pseudo-eigenvalues of
%          Toeplitz matrices, Linear Algebra and Appl., 162-164:153-185, 1992.

if nargin < 2, k = 0; end

w = exp(2*pi*i/n);
A = diag( [w.^(1:n-1) 1] ) + diag(ones(n-1,1),1);
if k == 0, A(n,1) = 1; end
