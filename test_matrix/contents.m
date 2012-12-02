% Test Matrix Toolbox.
% Version 3.0, September 19 1995
% Copyright (c) 1995 by N. J. Higham
%
% Demonstration
%TMTDEMO   Demonstration of Test Matrix Toolbox.
%
% Test Matrices
%AUGMENT   Augmented system matrix.
%CAUCHY    Cauchy matrix.
%CHEBSPEC  Chebyshev spectral differentiation matrix.
%CHEBVAND  Vandermonde-like matrix for the Chebyshev polynomials.
%CHOW      Chow matrix - a singular Toeplitz lower Hessenberg matrix.
%CIRCUL    Circulant matrix.
%CLEMENT   Clement matrix - tridiagonal with zero diagonal entries.
%COMPAN    Companion matrix.
%CONDEX    `Counterexamples' to matrix condition estimators.
%CYCOL     Matrix whose columns repeat cyclically.
%DINGDONG  Dingdong matrix - a symmetric Hankel matrix.
%DORR      Dorr matrix - diag. dominant, ill-conditioned, tridiagonal (sparse).
%DRAMADAH  A (0,1) matrix with large inverse.
%FIEDLER   Fiedler matrix - symmetric.
%FORSYTHE  Forsythe matrix - a perturbed Jordan block.
%FRANK     Frank matrix - ill-conditioned eigenvalues.
%GALLERY   Famous, and not so famous, test matrices.
%GEARM     Gear matrix.
%GFPP      Matrix giving maximal growth factor for Gaussian elim. with pivoting.
%GRCAR     Grcar matrix - a Toeplitz matrix with sensitive eigenvalues.
%HADAMARD  Hadamard matrix.
%HANOWA    Hanowa matrix.
%HILB      Hilbert matrix.
%INVHESS   Inverse of an upper Hessenberg matrix.
%INVOL     An involutory matrix.
%IPJFACT   A Hankel matrix with factorial elements.
%JORDBLOC  Jordan block.
%KAHAN     Kahan matrix - upper trapezoidal.
%KMS       Kac-Murdock-Szego Toeplitz matrix.
%KRYLOV    Krylov matrix.
%LAUCHLI   Lauchli matrix.
%LEHMER    Lehmer matrix - symmetric positive definite.
%LESP      A tridiagonal matrix with real, sensitive eigenvalues.
%LOTKIN    Lotkin matrix.
%MAKEJCF   A matrix with given Jordan canonical form.
%MINIJ     Symmetric positive definite matrix MIN(i,j).
%MOLER     Moler matrix - symmetric positive definite.
%NEUMANN   Singular matrix from the discrete Neumann problem.
%OHESS     Random, orthogonal upper Hessenberg matrix.
%ORTHOG    Orthogonal and nearly orthogonal matrices.
%PARTER    Parter matrix - a Toeplitz matrix with singular values near PI.
%PASCAL    Pascal matrix.
%PDTOEP    Symmetric positive definite Toeplitz matrix.
%PEI       Pei matrix.
%PENTOEP   Pentadiagonal Toeplitz matrix (sparse).
%POISSON   Block tridiagonal matrix from Poisson's equation (sparse).
%PROLATE   Prolate matrix - symmetric, ill-conditioned Toeplitz matrix.
%RANDO     Random matrix with elements -1, 0 or 1.
%RANDSVD   Random matrices with pre-assigned singular values.
%REDHEFF   A matrix of 0s and 1s of Redheffer.
%RIEMANN   A matrix associated with the Riemann hypothesis.
%RSCHUR    An upper quasi-triangular matrix.
%SMOKE     Smoke matrix - complex, with a `smoke ring' pseudospectrum.
%TRIDIAG   Tridiagonal matrix (sparse).
%TRIW      Upper triangular matrix discussed by Wilkinson and others.
%VAND      Vandermonde matrix.
%WATHEN    Wathen matrix - a finite element matrix (sparse, random entries).
%WILK      Various specific matrices devised/discussed by Wilkinson.
%
% Visualization
%FV        Field of values (or numerical range).
%GERSH     Gershgorin disks.
%PS        Approximation to the pseudospectrum.
%PSCONT    Contours and colour pictures of pseudospectra.
%SEE       Pictures of a matrix and its (pseudo-) inverse.
%
% Decompositions and factorizations.
%CGS       Gram-Schmidt QR factorization.
%CHOLP     Cholesky factorization with pivoting of a pos. semidefinite matrix.
%COD       Complete orthogonal decomposition.
%DIAGPIV   Diagonal pivoting factorization with partial pivoting.
%GE        Gaussian elimination without pivoting.
%GECP      Gaussian elimination with complete pivoting.
%GJ        Gauss-Jordan elimination to solve Ax = b.
%MGS       Modified Gram-Schmidt QR factorization.
%POLDEC    Polar decomposition.
%SIGNM     Matrix sign decomposition.
%
% Direct Search Optimization.
%ADSMAX  Alternating directions direct search method.
%MDSMAX  Multidirectional search method for direct search optimization.
%NMSMAX  Nedler-Mead simplex method for direct search optimization.
%
% Miscellaneous
%BANDRED   Band reduction by two-sided orthogonal transformations.
%CHOP      Round matrix elements.
%COMP      Comparison matrices.
%COND      Matrix condition number in 1, 2, Frobenius, or infinity norm.
%CPLTAXES  Determine suitable AXIS for plot of complex vector.
%DUAL      Dual vector with respect to Holder p-norm.
%EIGSENS   Eigenvalue condition numbers.
%HOUSE     Householder matrix.
%MATRIX    Test Matrix Collection information and access by number.
%MATSIGNT  Matrix sign function of a triangular matrix.
%PNORM     Estimate of matrix p-norm (1 <= p <= inf).
%QMULT     Pre-multiply by random orthogonal matrix.
%RQ        Rayleigh quotient.
%SEQA      An additive sequence.
%SEQCHEB   Sequence of points related to Chebyshev polynomials, T_N.
%SEQM      A multiplicative sequence.
%SHOW      Display signs of matrix elements.
%SKEWPART  Skew-symmetric (Hermitian) part.
%SPARSIFY  Randomly sets matrix elements to zero.
%SUB       Principal submatrix.
%SYMMPART  Symmetric (Hermitian) part.
%TRAP2TRI  Trapezoidal matrix to triangular form.
