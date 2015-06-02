function [ i, j ] = i4_to_pascal ( k )

%*****************************************************************************80
%
%% I4_TO_PASCAL converts a linear index to Pascal triangle coordinates.
%
%  Discussion:
%
%    We describe the grid points in Pascal's triangle in two ways:
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
%    14 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the linear index of the (I,J) element.
%    1 <= K.
%
%    Output, integer I, J, the Pascal indices.
%
  if ( k <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_PASCAL - Fatal error!\n' );
    fprintf ( 1, '  K must be positive.\n' );
    error ( 'I4_TO_PASCAL - Fatal error!' );
  end

  d = i4_to_pascal_degree ( k );

  j = k - ( d * ( d + 1 ) ) / 2 - 1;
  i = d - j;

  return
end
