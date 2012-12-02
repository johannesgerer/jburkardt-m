function sparse_grid_hermite_test01 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% TEST01 tests SPARSE_GRID_HERM_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 December 2009
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  SPARSE_GRID_HERM_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a Gauss-Hermite sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note that, unlike most sparse grids, a sparse grid\n' );
  fprintf ( 1, '  based on Gauss-Hermite points is almost entirely \n' );
  fprintf ( 1, '  NOT nested.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hence the point counts should be much higher than for a grid of\n' );
  fprintf ( 1, '  the same level, but using rules such as Fejer2 or\n' );
  fprintf ( 1, '  Gauss-Patterson or Newton-Cotes-Open.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each sparse grid is of spatial dimension DIM,\n' );
  fprintf ( 1, '  and is made up of all product grids of levels up to LEVEL_MAX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     DIM: ' );

  for dim_num = dim_min : dim_max
    fprintf ( 1, '  %10d', dim_num );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   LEVEL_MAX\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max
    fprintf ( 1, '    %4d', level_max );
    for dim_num = dim_min : dim_max
      point_num = sparse_grid_herm_size ( dim_num, level_max );
      fprintf ( 1, '  %10d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
