function sparse_grid_open_test08 ( dim_num, level_max )

%*****************************************************************************80
%
%% TEST08 creates and writes sparse grid files of all types.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08:\n' );
  fprintf ( 1, '  Make sparse grids and write to files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );

  point_num = sparse_grid_ofn_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the orders and points.
%
  grid_index = levels_open_index ( dim_num, level_max, point_num );
%
%  Now we're done.  Print the merged grid data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid index:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : point_num
    fprintf ( 1, '  %4d', j );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_index(dim,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Convert index information to physical information.
%
  order_max = 2^( level_max + 1 ) - 1;

  grid_point = zeros ( dim_num, point_num );
%
%  Create F2 data and write to file.
%
  for j = 1 : point_num
    for dim = 1 : dim_num
      grid_point(dim,j) = f2_abscissa ( order_max, grid_index(dim,j) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid points:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : point_num
    fprintf ( 1, '  %4d', j );
    for dim = 1 : dim_num
      fprintf ( 1, '%10f', grid_point(dim,j) );
    end
    fprintf ( 1, '\n' );
  end

  file_name = strcat ( 'f2_d', num2str ( dim_num ), '_level', ...
    num2str ( level_max ), '.txt' );

  r8mat_write ( file_name, dim_num, point_num, grid_point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote file "%s".\n', file_name );
%
%  Create GP data and write to file.
%
  order_max = 2^(level_max + 1 ) - 1;

  for j = 1 : point_num
    for dim = 1 : dim_num
      grid_point(dim,j) = gp_abscissa ( order_max, grid_index(dim,j) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid points:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : point_num
    fprintf ( 1, '  %4d', j );
    for dim = 1 : dim_num
      fprintf ( 1, '%10f', grid_point(dim,j) );
    end
    fprintf ( 1, '\n' );
  end

  file_name = strcat ( 'gp_d', num2str ( dim_num ), '_level', ...
    num2str ( level_max ), '.txt' );

  r8mat_write ( file_name, dim_num, point_num, grid_point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote file "%s".\n', file_name );
%
%  Create NCO data and write to file.
%
  for j = 1 : point_num
    for dim = 1 : dim_num
      grid_point(dim,j) = nco_abscissa ( order_max, grid_index(dim,j) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid points:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : point_num
    fprintf ( 1, '  %4d', j );
    for dim = 1 : dim_num
      fprintf ( 1, '%10f', grid_point(dim,j) );
    end
    fprintf ( 1, '\n' );
  end

  file_name = strcat ( 'nco_d', num2str ( dim_num ), '_level', ...
    num2str ( level_max ), '.txt' );

  r8mat_write ( file_name, dim_num, point_num, grid_point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote file "%s".\n', file_name );

  return
end
