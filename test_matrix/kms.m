function A = kms(n, rho)
%KMS   Kac-Murdock-Szego Toeplitz matrix.
%      A = KMS(N, RHO) is the N-by-N Kac-Murdock-Szego Toeplitz matrix with
%      A(i,j) = RHO^(ABS((i-j))) (for real RHO).
%      If RHO is complex, then the same formula holds except that elements
%      below the diagonal are conjugated.
%      RHO defaults to 0.5.
%      Properties:
%         A has an LDL' factorization with
%                  L = INV(TRIW(N,-RHO,1)'),
%                  D(i,i) = (1-ABS(RHO)^2)*EYE(N) except D(1,1) = 1.
%         A is positive definite if and only if 0 < ABS(RHO) < 1.
%         INV(A) is tridiagonal.

%       Reference:
%       W.F. Trench, Numerical solution of the eigenvalue problem
%       for Hermitian Toeplitz matrices, SIAM J. Matrix Analysis and Appl.,
%       10 (1989), pp. 135-146 (and see the references therein).

if nargin < 2, rho = 0.5; end

A = (1:n)'*ones(1,n);
A = abs(A - A');
A = rho .^ A;
if imag(rho)
   A = conj(tril(A,-1)) + triu(A);
end
