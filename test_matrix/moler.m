function A = moler(n, alpha)
%MOLER   Moler matrix - symmetric positive definite.
%        A = MOLER(N, ALPHA) is the symmetric positive definite N-by-N matrix
%        U'*U where U = TRIW(N, ALPHA).
%        For ALPHA = -1 (the default) A(i,j) = MIN(i,j)-2, A(i,i) = i.
%        A has one small eigenvalue.

%        Nash (1990) attributes the ALPHA = -1 matrix to Moler.
%
%        Reference:
%        J.C. Nash, Compact Numerical Methods for Computers: Linear
%        Algebra and Function Minimisation, second edition, Adam Hilger,
%        Bristol, 1990 (Appendix 1).

if nargin == 1, alpha = -1; end

A = triw(n, alpha)'*triw(n, alpha);
