function [ i, j ] = i4_to_triangle ( k )

%*****************************************************************************80
%
%% I4_TO_TRIANGLE converts an integer to triangular coordinates.
%
%  Discussion:
%
%    Triangular coordinates are handy when storing a naturally triangular
%    array (such as the lower half of a matrix) in a linear array.
%
%    Thus, for example, we might consider storing
%
%    (1,1)
%    (2,1) (2,2)
%    (3,1) (3,2) (3,3)
%    (4,1) (4,2) (4,3) (4,4)
%
%    as the linear array
%
%    (1,1) (2,1) (2,2) (3,1) (3,2) (3,3) (4,1) (4,2) (4,3) (4,4)
%
%    Here, the quantities in parenthesis represent the natural row and
%    column indices of a single number when stored in a rectangular array.
%
%    In this routine, we are given the location K of an item in the
%    linear array, and wish to determine the row I and column J
%    of the item when stored in the triangular array.
%
%  First Values:
%
%     K  I  J
%
%     0  0  0
%     1  1  1
%     2  2  1
%     3  2  2
%     4  3  1
%     5  3  2
%     6  3  3
%     7  4  1
%     8  4  2
%     9  4  3
%    10  4  4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the linear index of the (I,J) element, which
%    must be nonnegative.
%
%    Output, integer I, J, the row and column indices.
%
  if ( k < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_TRIANGLE - Fatal error!\n' );
    fprintf ( 1, '  K < 0.\n' );
    fprintf ( 1, '  K = %d\n', k );
    error ( 'I4_TO_TRIANGLE - Fatal error!' );

  elseif ( k == 0 )

    i = 0;
    j = 0;
    return

  end

  i = floor ( sqrt ( 2 * k ) );

  if ( i * i + i < 2 * k )
    i = i + 1;
  end

  j = k - ( i * ( i - 1 ) ) / 2;

  return
end
