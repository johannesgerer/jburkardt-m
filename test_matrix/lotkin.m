function A = lotkin(n)
%LOTKIN  Lotkin matrix.
%        A = LOTKIN(N) is the Hilbert matrix with its first row altered to
%        all ones.  A is unsymmetric, ill-conditioned, and has many negative
%        eigenvalues of small magnitude.
%        The inverse has integer entries and is known explicitly.

%        Reference:
%        M. Lotkin, A set of test matrices, MTAC, 9 (1955), pp. 153-161.

A = hilb(n);
A(1,:) = ones(1,n);
