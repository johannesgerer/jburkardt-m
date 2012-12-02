function A = lehmer(n)
%LEHMER  Lehmer matrix - symmetric positive definite.
%        A = LEHMER(N) is the symmetric positive definite N-by-N matrix with
%                         A(i,j) = i/j for j >= i.
%        A is totally nonnegative.  INV(A) is tridiagonal, and explicit
%        formulas are known for its entries.
%        N <= COND(A) <= 4*N*N.

%        References:
%        M. Newman and J. Todd, The evaluation of matrix inversion
%           programs, J. Soc. Indust. Appl. Math., 6 (1958), pp. 466-476.
%        Solutions to problem E710 (proposed by D.H. Lehmer): The inverse
%           of a matrix, Amer. Math. Monthly, 53 (1946), pp. 534-535.
%        J. Todd, Basic Numerical Mathematics, Vol. 2: Numerical Algebra,
%           Birkhauser, Basel, and Academic Press, New York, 1977, p. 154.

A = ones(n,1)*(1:n);
A = A./A';
A = tril(A) + tril(A,-1)';
