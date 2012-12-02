function a = rectangle_adj ( row_num, col_num, n )

%*****************************************************************************80
%
%% RECTANGLE_ADJ returns the rectangle_adjacency matrix.
%
%  Discussion:
%
%    This is the adjacency matrix for a set of points arranged in
%    a ROW_NUM by COL_NUM grid.
%
%  Diagram:
%
%     1---5---9
%     |   |   |
%     2---6--10
%     |   |   |
%     3---7--11
%     |   |   |
%     4---8--12
%
%  Example:
%
%    ROW_NUM = 4
%    COL_NUM = 3
%
%    0  1  0  0    1  0  0  0    0  0  0  0
%    1  0  1  0    0  1  0  0    0  0  0  0
%    0  1  0  1    0  0  1  0    0  0  0  0
%    0  0  1  0    1  0  0  1    0  0  0  0
%
%    1  0  0  0    0  1  0  0    1  0  0  0
%    0  1  0  0    1  0  1  0    0  1  0  0
%    0  0  1  0    0  1  0  1    0  0  1  0
%    0  0  0  1    0  0  1  0    0  0  0  1
%
%    0  0  0  0    1  0  0  0    0  1  0  0
%    0  0  0  0    0  1  0  0    1  0  1  0
%    0  0  0  0    0  0  1  0    0  1  0  1
%    0  0  0  0    0  0  0  1    0  0  1  0
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is a zero/one matrix.
%
%    A is block tridiagonal.
%
%    A is an adjacency matrix.
%
%    A is related to the "LIGHTS_OUT" matrix.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ROW_NUM, COL_NUM, the number of rows and 
%    columns in the rectangle.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for j_block = 1 : col_num

    j = ( j_block - 1 ) * row_num + 1;

    for i_block = 1 : col_num

      i = ( i_block - 1 ) * row_num + 1;

      if ( j_block == i_block )
        a(i:i+row_num-1,j:j+row_num-1) = line_adj ( row_num );
      elseif ( abs ( j_block - i_block ) == 1 )
        a(i:i+row_num-1,j:j+row_num-1) = identity ( row_num, row_num );
      else
        a(i:i+row_num-1,j:j+row_num-1) = zero ( row_num, row_num );
      end

    end
  end

  return
end
