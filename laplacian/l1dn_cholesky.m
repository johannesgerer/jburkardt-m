function c = l1dn_cholesky ( n, h )

%*****************************************************************************80
%
%% L1DN_CHOLESKY computes the Cholesky factor of the 1D DN Laplacian.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%    N must be at least 3.
%
%    Input, real H, the spacing between points.
%
%    Output, real C(N,N), the Cholesky factor.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'L1DN_CHOLESKY - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1DN_CHOLESKY - Fatal error!' );
  end

  c = zeros ( n, n );

  for i = 1 : n - 1
    c(i,i)   =   sqrt ( i + 1.0 ) / sqrt ( i );
    c(i,i+1) = - sqrt ( i ) / sqrt ( i + 1.0 );
  end
  c(n,n) = 1.0 / sqrt ( n );

  c(1:n,1:n) = c(1:n,1:n) / h;

  return
end
