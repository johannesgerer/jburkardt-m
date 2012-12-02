function sparse_grid_cc_test015 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% TEST015 tests SPARSE_GRID_CCS_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_MIN, the minimum spatial dimension to consider.
%
%    Input, integer DIM_MAX, the maximum spatial dimension to consider.
%
%    Input, integer LEVEL_MAX_MIN, the minimum value of LEVEL_MAX to consider.
%
%    Input, integer LEVEL_MAX_MAX, the maximum value of LEVEL_MAX to consider.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST015\n' );
  fprintf ( 1, '  SPARSE_GRID_CCS_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a Clenshaw Curtis Slow-Growth sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each sparse grid is of spatial dimension DIM,\n' );
  fprintf ( 1, '  and is made up of all product grids of levels up to LEVEL_MAX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   DIM: ' );

  for dim_num = dim_min : dim_max
    fprintf ( 1, '  %8d', dim_num );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   LEVEL_MAX\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max
    fprintf ( 1, '    %4d', level_max );
    for dim_num = dim_min : dim_max
      point_num = sparse_grid_ccs_size ( dim_num, level_max );
      fprintf ( 1, '  %8d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
