function grid = simplex_grid_index_all ( m, n, ng )

%*****************************************************************************80
%
%% SIMPLEX_GRID_INDEX_ALL returns all the simplex grid indices.
%
%  Discussion:
%
%    The number of grid indices can be determined by calling 
%      ng = simplex_grid_size ( m, n );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of subintervals.
%
%    Input, integer NG, the number of values in the grid.
%
%    Output, integer GRID(M+1,NG), the current, and then the next, grid index.
%
  grid = zeros ( m + 1, ng );

  g = zeros ( m + 1, 1 );
  g(m+1,1) = n;

  k = 1;
  grid(1:m+1,k) = g(1:m+1,1);

  while ( k < ng )
    g = comp_next_grlex ( m + 1, g );
    k = k + 1;
    grid(1:m+1,k) = g(1:m+1,1);
  end

  return
end

