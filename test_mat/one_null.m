function x = one_null ( n )

%*****************************************************************************80
%
%% ONE_NULL returns a null vector of the ONE matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real X(N), the null vector.
%
  if ( n == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ONE_NULL - Fatal error!\n' );
    fprintf ( 1, '  Matrix is nonsingular for N = 1.\n' );
    error ( 'ONES_NULL - Fatal error!' );
  end

  x(1) =     1.0;
  x(2:n-1) = 0.0;
  x(n) =    -1.0;

  return
end
