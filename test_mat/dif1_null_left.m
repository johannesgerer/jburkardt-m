function x = dif1_null_left ( m, n )

%*****************************************************************************80
%
%% DIF1_NULL_LEFT returns a left null vector of the DIF1 matrix.
%
%  Discussion:
%
%    M must not be even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(M,1), the null vector.
%
  if ( mod ( m, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF1_NULL_LEFT - Fatal error!\n' );
    fprintf ( 1, '  The matrix is not singular for even M.\n' );
    error ( 'DIF1_NULL_LEFT - Fatal error!' );
  end

  x = zeros ( m, 1 );

  x(1:2:m,1) = 1.0;

  return
end
