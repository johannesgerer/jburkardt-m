function sparse_grid_pure_test06 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% TEST06 tests SPARSE_GRID_ONN_E_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2010
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  SPARSE_GRID_ONN_E_SIZE returns the number of\n' );
  fprintf ( 1, '  distinct points in a ONN_E sparse grid made from \n' );
  fprintf ( 1, '  product grids formed from open non-nested\n' );
  fprintf ( 1, '  quadrature rules with exponential growth, including:\n' );
  fprintf ( 1, '  * LG_E, the Gauss Laguerre Exponential Growth Family;\n' );
  fprintf ( 1, '  * GJ_E, the Gauss Jacobi Exponential Growth Family;\n' );
  fprintf ( 1, '  * GLG_E, the Generalized Gauss Laguerre Exponential Growth Family;\n' );
  fprintf ( 1, '  * GW_E, any Golub Welsch Exponential Growth Family;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   DIM: ' );

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
      point_num = sparse_grid_onn_e_size ( dim_num, level_max );
      fprintf ( 1, '  %10d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
