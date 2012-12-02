function k = triangle_to_i4 ( i, j )

%*****************************************************************************80
%
%% TRIANGLE_TO_I4 converts a triangular coordinate to an integer.
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
%    Thus, our goal is, given the row I and column J of the data,
%    to produce the value K which indicates its position in the linear
%    array.
%
%    The triangular numbers are the indices associated with the
%    diagonal elements of the original array, T(1,1), T(2,2), T(3,3)
%    and so on.
%
%  Formula:
%
%    K = J + ( (I-1) * I ) / 2
%
%  First Values:
%
%     I  J  K
%
%     0  0  0
%     1  1  1
%     2  1  2
%     2  2  3
%     3  1  4
%     3  2  5
%     3  3  6
%     4  1  7
%     4  2  8
%     4  3  9
%     4  4 10
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the row and column indices.  I and J must
%    be nonnegative, and J must not be greater than I.
%
%    Output, integer K, the linear index of the (I,J) element.
%
  if ( i < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  I < 0.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'TRIANGLE_TO_I4 - Fatal error!' );
  elseif ( j < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  J < 0.\n' );
    fprintf ( 1, '  J = %d\n', j );
    error ( 'TRIANGLE_TO_I4 - Fatal error!' );
  elseif ( i < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  I < J.\n' );
    fprintf ( 1, '  I = %d\n', i );
    fprintf ( 1, '  J = %d\n', j );
    error ( 'TRIANGLE_TO_I4 - Fatal error!' );
  end

  k = j + ( ( i - 1 ) * i ) / 2;

  return
end
