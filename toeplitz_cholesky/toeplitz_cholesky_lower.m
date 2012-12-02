function l = toeplitz_cholesky_lower ( n, a )

%*****************************************************************************80
%
%% TOEPLITZ_CHOLESKY_LOWER computes the lower Cholesky factor of a Toeplitz matrix.
%
%  Discussion:
%
%    The Toeplitz matrix must be positive semi-definite.
%
%    After factorization, A = L * L'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2012
%
%  Author:
%
%    Michael Stewart
%
%  Reference:
%
%    Michael Stewart,
%    Cholesky factorization of semi-definite Toeplitz matrices.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the Toeplitz matrix.
%
%    Output, real L(N,N), the lower Cholesky factor.
%
  g = zeros ( 2, n );
  g(1,1:n) = a(1:n,1);
  g(2,1) = 0.0;
  g(2,2:n) = a(2:n,1)'; 

  l = zeros ( n, n );
  l(1:n,1) = g(1,1:n)';
  g(1,2:n) = g(1,1:n-1);
  g(1,1) = 0.0;
  for i = 2 : n
    rho = - g(2,i) / g(1,i);
    g(:,i:n) = ( [ 1 rho; rho 1 ] * g(:,i:n) ) / sqrt ( ( 1 - rho ) * ( 1 + rho ) );
    l(i:n,i) = g(1,i:n)';
    g(1,i+1:n) = g(1,i:n-1);
    g(1,i) = 0.0;
  end

  return
end

