function A = poisson(n)
%POISSON   Block tridiagonal matrix from Poisson's equation (sparse).
%          POISSON(N) is the block tridiagonal matrix of order N^2
%          resulting from discretizing Poisson's equation with the
%          5-point operator on an N-by-N mesh.

%          Reference:
%          G.H. Golub and C.F. Van Loan, Matrix Computations, second edition,
%          Johns Hopkins University Press, Baltimore, Maryland, 1989
%          (Section 4.5.4).

S = tridiag(n,-1,2,-1);
I = speye(n);
A = kron(I,S) + kron(S,I);
