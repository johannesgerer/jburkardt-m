function sparse_grid_cc_test02 ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_TEST02 tests SPARSE_GRID_CC_INDEX.
%
%  Discussion:
%
%    The routine computes the indices of the unique points used in a sparse
%    multidimensional grid whose size is controlled by a parameter LEVEL_MAX.
%
%    Once these indices are returned, they can be converted into
%    Clenshaw Curtis points.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  SPARSE_GRID_CC_INDEX returns all grid indexes\n' );
  fprintf ( 1, '  whose level value satisfies\n' );
  fprintf ( 1, '    0 <= LEVEL <= LEVEL_MAX.\n' );
  fprintf ( 1, '  Here, LEVEL is the sum of the levels of the 1D rules,\n' );
  fprintf ( 1, '  and the order of the rule is 2**LEVEL + 1.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MAX = %d\n',level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );

  point_num = sparse_grid_cfn_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the orders and points.
%
  grid_index = sparse_grid_cc_index ( dim_num, level_max, point_num );
%
%  Now we're done.  Print the merged grid data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid index:\n' );
  fprintf ( 1, '\n' );

  for point = 1 : point_num
    fprintf ( 1, '  %4d', point );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_index(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
