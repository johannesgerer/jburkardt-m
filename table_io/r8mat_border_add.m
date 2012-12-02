function table2 = r8mat_border_add ( m, n, table )

%*****************************************************************************80
%
%% R8MAT_BORDER_ADD adds a "border" to an R8MAT.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%    We suppose the input data gives values of a quantity on nodes
%    in the interior of a 2D grid, and we wish to create a new table
%    with additional positions for the nodes that would be on the
%    border of the 2D grid.
%
%                  0 0 0 0 0 0
%      * * * *     0 * * * * 0
%      * * * * --> 0 * * * * 0
%      * * * *     0 * * * * 0
%                  0 0 0 0 0 0
%
%    The illustration suggests the situation in which a 3 by 4 array
%    is input, and a 5 by 6 array is to be output.
%
%    The old data is shifted to its correct positions in the new array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the table data.
%
%    Output, real TABLE2(M+2,N+2), the augmented table data.
%
  table2 = zeros(m+2,n+2);

  table2(1,1:n+2) = 0.0;
  table2(m+2,1:n+2) = 0.0;
  table2(2:m+1,1) = 0.0;
  table2(2:m+1,n+2) = 0.0;

  table2(2:m+1,2:n+1) = table(1:m,1:n);

  return
end
