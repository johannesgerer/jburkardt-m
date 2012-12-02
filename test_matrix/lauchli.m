function A = lauchli(n, mu)
%LAUCHLI   Lauchli matrix - rectangular.
%          LAUCHLI(N, MU) is the (N+1)-by-N matrix [ONES(1,N); MU*EYE(N))].
%          It is a well-known example in least squares and other problems
%          that indicates the dangers of forming A'*A.
%          MU defaults to SQRT(EPS).

%          Reference:
%          P. Lauchli, Jordan-Elimination und Ausgleichung nach
%          kleinsten Quadraten, Numer. Math, 3 (1961), pp. 226-240.

if nargin < 2, mu = sqrt(eps); end
A = [ones(1,n);
     mu*eye(n)];
