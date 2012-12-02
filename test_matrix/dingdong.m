function A = dingdong(n)
%DINGDONG  Dingdong matrix - a symmetric Hankel matrix.
%          A = DINGDONG(N) is the symmetric N-by-N Hankel matrix with
%                         A(i,j) = 0.5/(N-i-j+1.5).
%          The eigenvalues of A cluster around PI/2 and -PI/2.

%          Invented by F.N. Ris.
%
%          Reference:
%          J.C. Nash, Compact Numerical Methods for Computers: Linear
%          Algebra and Function Minimisation, second edition, Adam Hilger,
%          Bristol, 1990 (Appendix 1).

p= -2*(1:n) + (n+1.5);
A = cauchy(p);
