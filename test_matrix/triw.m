function t = triw(n, alpha, k)
%TRIW   Upper triangular matrix discussed by Wilkinson and others.
%       TRIW(N, ALPHA, K) is the upper triangular matrix with ones on
%       the diagonal and ALPHAs on the first K >= 0 superdiagonals.
%       N may be a 2-vector, in which case the matrix is N(1)-by-N(2) and
%       upper trapezoidal.
%       Defaults: ALPHA = -1,
%                 K = N - 1     (full upper triangle).
%       TRIW(N) is a matrix discussed by Kahan, Golub and Wilkinson.
%
%       Ostrowski (1954) shows that
%         COND(TRIW(N,2)) = COT(PI/(4*N))^2,
%       and for large ABS(ALPHA),
%         COND(TRIW(N,ALPHA)) is approximately ABS(ALPHA)^N*SIN(PI/(4*N-2)).
%
%       Adding -2^(2-N) to the (N,1) element makes TRIW(N) singular,
%       as does adding -2^(1-N) to all elements in the first column.

%       References:
%       G.H. Golub and J.H. Wilkinson, Ill-conditioned eigensystems and the
%          computation of the Jordan canonical form, SIAM Review,
%          18(4), 1976, pp. 578-619.
%       W. Kahan, Numerical linear algebra, Canadian Math. Bulletin,
%          9 (1966), pp. 757-801.
%       A.M. Ostrowski, On the spectrum of a one-parametric family of
%          matrices, J. Reine Angew. Math., 193 (3/4), 1954, pp. 143-160.
%       J.H. Wilkinson, Singular-value decomposition---basic aspects,
%          in D.A.H. Jacobs, ed., Numerical Software---Needs and Availability,
%          Academic Press, London, 1978, pp. 109-135.

m = n(1);              % Parameter n specifies dimension: m-by-n.
n = n(max(size(n)));

if nargin < 3, k = n-1; end
if nargin < 2, alpha = -1; end

if max(size(alpha)) ~= 1
   error('Second argument must be a scalar.')
end 

t = tril( eye(m,n) + alpha*triu(ones(m,n), 1), k);
