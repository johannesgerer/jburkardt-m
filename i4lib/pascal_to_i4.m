function k = pascal_to_i4 ( i, j )

%*****************************************************************************80
%
%% PASCAL_TO_I4 converts Pacal triangle coordinates to a linear index.
%
%  Discussion:
%
%    We describe the grid points in a Pascal triangle in two ways:
%
%    As a linear index K:
%
%                     1
%                   2   3
%                 4   5   6
%               7   8   9   10
%
%    As elements (I,J) of Pascal's triangle:
%
%                     0,0
%                  1,0   0,1
%               2,0   1,1    0,2
%            3,0   2,1   1,2    0,3
%
%  Example:
%
%     K  I  J
%
%     1  0  0
%     2  1  0
%     3  0  1
%     4  2  0
%     5  1  1
%     6  0  2
%     7  3  0
%     8  2  1
%     9  1  2
%    10  0  3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the row and column indices.  I and J must
%    be nonnegative.
%
%    Output, integer K, the linear index of the (I,J) element.
%
  if ( i < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PASCAL_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  I < 0.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'PASCAL_TO_I4 - Fatal error!' );
  elseif ( j < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PASCAL_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  J < 0.\n' );
    fprintf ( 1, '  J = %d\n', j );
    error ( 'PASCAL_TO_I4 - Fatal error!' );
  end

  d = i + j;

  k = ( d * ( d + 1 ) ) / 2 + j + 1;

  return
end
