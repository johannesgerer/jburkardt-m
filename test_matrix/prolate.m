function A = prolate(n, w)
%PROLATE   Prolate matrix - symmetric, ill-conditioned Toeplitz matrix.
%          A = PROLATE(N, W) is the N-by-N prolate matrix with parameter W.
%          It is a symmetric Toeplitz matrix.
%          If 0 < W < 0.5 then
%             - A is positive definite
%             - the eigenvalues of A are distinct, lie in (0, 1), and
%               tend to cluster around 0 and 1.
%          W defaults to 0.25.

%          Reference:
%          J.M. Varah. The Prolate matrix. Linear Algebra and Appl.,
%          187:269--278, 1993.

if nargin == 1, w = 0.25; end

a = zeros(n,1);
a(1) = 2*w;
a(2:n) = sin( 2*pi*w*(1:n-1) ) ./ ( pi*(1:n-1) );

A = toeplitz(a);
