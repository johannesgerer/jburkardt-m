function x = one_null_left ( m, n )

%*****************************************************************************80
%
%% ONE_NULL_LEFT returns a left null vector of the ONE matrix.
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
%    Input, integer M, N, the order of the matrix.
%
%    Output, real X(M,1), the null vector.
%
  if ( m == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ONE_NULL_LEFT - Fatal error!\n' );
    fprintf ( 1, '  Matrix is nonsingular for M = 1.\n' );
    error ( 'ONE_NULL_LEFT - Fatal error!' );
  end

  x = zeros ( m, 1 );

  x(1,1) =  1.0;
  x(m,1) = -1.0;

  return
end
