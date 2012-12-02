function [L, U, rho] = ge(A)
%GE     Gaussian elimination without pivoting.
%       [L, U, RHO] = GE(A) computes the factorization A = L*U,
%       where L is unit lower triangular and U is upper triangular.
%       RHO is the growth factor.
%       By itself, GE(A) returns the final reduced matrix from the
%       elimination containing both L and U.

[n, n] = size(A);
if nargout == 3
   maxA = norm(A(:), inf);
   rho = maxA;
end

for k = 1:n-1

    if A(k,k) == 0
      error('Elimination breaks down with zero pivot.  Quitting...')
    end

    A(k+1:n,k) = A(k+1:n,k)/A(k,k);          % Multipliers.

    % Elimination
    i = k+1:n;
    A(i,i) = A(i,i) - A(i,k) * A(k,i);
    if nargout == 3, rho = max( rho, max(max(abs(A(i,i)))) ); end

end

if nargout <= 1
   L = A;
   return
end

L = tril(A,-1) + eye(n);
U = triu(A);
if nargout == 3, rho = rho/maxA; end
