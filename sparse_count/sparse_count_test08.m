function sparse_count_test08 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% SPARSE_COUNT_TEST08 tests OWN_E_SIZE.
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
  fprintf ( 1, 'SPARSE_COUNT_TEST08\n' );
  fprintf ( 1, '  OWN_E_SIZE returns the number of\n' );
  fprintf ( 1, '  distinct points in an OWN_E sparse grid made from \n' );
  fprintf ( 1, '  product grids formed from open weakly nested \n' );
  fprintf ( 1, '  quadrature rules with exponential growth, including:\n' );
  fprintf ( 1, '  * GGH_E, the Generalized Gauss-Hermite Exponential Growth Family;\n' );
  fprintf ( 1, '  * GH_E, the Gauss-Hermite Exponential Growth Family;\n' );
  fprintf ( 1, '  * LG_E, the Gauss-Legendre Exponential Growth Family;\n' );
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
      point_num = own_e_size ( dim_num, level_max );
      fprintf ( 1, '  %10d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
