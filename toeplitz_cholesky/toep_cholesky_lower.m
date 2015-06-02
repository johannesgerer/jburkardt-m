function l = toep_cholesky_lower ( n, g )

%*****************************************************************************80
%
%% TOEP_CHOLESKY_LOWER: lower Cholesky factor of a compressed Toeplitz matrix.
%
%  Discussion:
%
%    The Toeplitz matrix A is supplied in a compressed form G.
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
%    Input, real G(2,N), the compressed Toeplitz matrix.
%    G(1,1:N) contains the first row.
%    G(2,2:N) contains the first column.
%
%    Output, real L(N,N), the lower Cholesky factor.
%
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

