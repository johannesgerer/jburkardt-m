function x = dif1_null_right ( m, n )

%*****************************************************************************80
%
%% DIF1_NULL_RIGHT returns a right null vector of the DIF1 matrix.
%
%  Discussion:
%
%    N must not be even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(N,1), the null vector.
%
  if ( mod ( n, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF1_NULL_RIGHT - Fatal error!\n' );
    fprintf ( 1, '  The matrix is not singular for even N.\n' );
    error ( 'DIF1_NULL_RIGHT - Fatal error!' );
  end

  x = zeros ( n, 1 );

  x(1:2:n,1) = 1.0;

  return
end
