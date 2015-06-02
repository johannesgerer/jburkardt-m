function sparse_count_test05 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% SPARSE_COUNT_TEST05 tests OFN_E_SIZE.
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
  fprintf ( 1, 'SPARSE_COUNT_TEST05\n' );
  fprintf ( 1, '  OFN_E_SIZE returns the number of\n' );
  fprintf ( 1, '  distinct points in a OFN_E sparse grid made from \n' );
  fprintf ( 1, '  product grids formed from open fully nested\n' );
  fprintf ( 1, '  quadrature rules with Exponential Growth, including\n' );
  fprintf ( 1, '  * F2_E, the Fejer Type 2 Exponential Growth Family:\n' );
  fprintf ( 1, '  * GP_E, the Gauss Patterson Exponential Growth Family;\n' );
  fprintf ( 1, '  * NCO_E, the Newton Cotes Open Exponential Growth Family.\n' );
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
      point_num = ofn_e_size ( dim_num, level_max );
      fprintf ( 1, '  %10d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
