function sparse_grid_open_test05 ( dim_num, level_max )

%*****************************************************************************80
%
%% TEST05 tests LEVELS_OPEN_INDEX to make a Gauss Patterson grid.
%
%  Discussion:
%
%    This routine gets the sparse grid indices and determines the 
%    corresponding sparse grid abscissas for a Gauss Patterson scheme.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05:\n' );
  fprintf ( 1, '  Make a sparse Gauss Patterson grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVELS_OPEN_INDEX returns all grid indexes\n' );
  fprintf ( 1, '  whose level value satisfies\n' );
  fprintf ( 1, '    0 <= LEVEL <= LEVEL_MAX.\n' );
  fprintf ( 1, '  Here, LEVEL is the sum of the levels of the 1D rules,\n' );
  fprintf ( 1, '  and the order of the rule is 2^(LEVEL+1) - 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now we demonstrate how to convert grid indices\n' );
  fprintf ( 1, '  into physical grid points.  In this case, we\n' );
  fprintf ( 1, '  want points on [-1,+1]^DIM_NUM.\n' );
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
  grid_point = zeros ( dim_num, point_num );

  order_max = 2^( level_max + 1 ) - 1;

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

  return
end
