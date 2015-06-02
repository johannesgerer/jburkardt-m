function x = one_null_right ( m, n )

%*****************************************************************************80
%
%% ONE_NULL_RIGHT returns a right null vector of the ONE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Output, real X(N,1), the null vector.
%
  if ( n == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ONE_NULL_RIGHT - Fatal error!\n' );
    fprintf ( 1, '  Matrix is nonsingular for N = 1.\n' );
    error ( 'ONE_NULL_RIGHT - Fatal error!' );
  end

  x = zeros ( n, 1 );

  x(1) =     1.0;
  x(n) =    -1.0;

  return
end
