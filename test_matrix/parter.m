function A = parter(n)
%PARTER    Parter matrix - a Toeplitz matrix with singular values near PI.
%          PARTER(N) is the matrix with (i,j) element 1/(i-j+0.5).
%          It is a Cauchy matrix and a Toeplitz matrix.

%          At the Second SIAM Conference on Linear Algebra, Raleigh, N.C.,
%          1985, Cleve Moler noted that most of the singular values of
%          PARTER(N) are very close to PI.  An explanation of the phenomenon
%          was given by Parter; see also the paper by Tyrtyshnikov.
%
%          References:
%          The MathWorks Newsletter, Volume 1, Issue 1, March 1986, page 2.
%          S.V. Parter, On the distribution of the singular values of Toeplitz
%               matrices, Linear Algebra and Appl., 80 (1986), pp. 115-130.
%          E.E. Tyrtyshnikov, Cauchy-Toeplitz matrices and some applications,
%               Linear Algebra and Appl., 149 (1991), pp. 1-18.

A = cauchy( (1:n)+0.5, -(1:n) );
