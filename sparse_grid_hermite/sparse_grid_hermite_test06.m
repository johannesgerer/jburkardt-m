function sparse_grid_hermite_test06 ( dim_num, level_max )

%*****************************************************************************80
%
%% TEST06 creates a sparse Gauss-Hermite grid and writes it to a file.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06:\n' );
  fprintf ( 1, '  SPARSE_GRID_HERM makes a sparse Gauss-Hermite grid.\n' );
  fprintf ( 1, '  Write the data to a set of quadrature files.\n' );

  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MIN = %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
%
%  Determine the number of points.
%
  point_num = sparse_grid_herm_size ( dim_num, level_max );

  r(1:dim_num,1) = - r8_huge ( );
  r(1:dim_num,2) = + r8_huge ( );
%
%  Compute the weights and points.
%
  [ w, x ] = sparse_grid_herm ( dim_num, level_max, point_num );
%
%  Write the data out.
%
  r_filename = sprintf ( 'gh_d%d_level%d_r.txt', dim_num, level_max );
  w_filename = sprintf ( 'gh_d%d_level%d_w.txt', dim_num, level_max );
  x_filename = sprintf ( 'gh_d%d_level%d_x.txt', dim_num, level_max );

  r8mat_write ( r_filename, dim_num, 2,         r );
  r8mat_write ( w_filename, 1,       point_num, w );
  r8mat_write ( x_filename, dim_num, point_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R data written to "%s".\n', r_filename );
  fprintf ( 1, '  W data written to "%s".\n', w_filename );
  fprintf ( 1, '  X data written to "%s",\n', x_filename );

  return
end
