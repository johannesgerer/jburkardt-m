function table2 = r8mat_border_cut ( m, n, table )

%*****************************************************************************80
%
%% R8MAT_BORDER_CUT cuts the "border" of an R8MAT.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%    We suppose the input data gives values of a quantity on nodes
%    on a 2D grid, and we wish to create a new table corresponding only
%    to those nodes in the interior of the 2D grid.
%
%      0 0 0 0 0 0
%      0 * * * * 0    * * * *
%      0 * * * * 0 -> * * * *
%      0 * * * * 0    * * * *
%      0 0 0 0 0 0
%
%    The illustration suggests the situation in which a 5 by 6 array
%    is input, and a 3 by 4 array is to be output.
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
%    Output, real TABLE2(M-2,N-2), the new table data.
%
  if ( m <= 2 || n <= 2 )
    table2 = [];
    return
  end

  table2(1:m-2,1:n-2) = table(2:m-1,2:n-1);

  return
end
