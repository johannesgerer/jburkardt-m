function A = cycol(n, k)
%CYCOL   Matrix whose columns repeat cyclically.
%        A = CYCOL([M N], K) is an M-by-N matrix of the form A = B(1:M,1:N)
%        where B = [C C C...] and C = RANDN(M, K).  Thus A's columns repeat
%        cyclically, and A has rank at most K.   K need not divide N.
%        K defaults to ROUND(N/4).
%        CYCOL(N, K), where N is a scalar, is the same as CYCOL([N N], K).
%
%        This type of matrix can lead to underflow problems for Gaussian
%        elimination: see NA Digest Volume 89, Issue 3 (January 22, 1989).

m = n(1);              % Parameter n specifies dimension: m-by-n.
n = n(max(size(n)));

if nargin < 2, k = max(round(n/4),1); end

A = randn(m, k);
for i=2:ceil(n/k)
    A = [A A(:,1:k)];
end

A = A(:, 1:n);
