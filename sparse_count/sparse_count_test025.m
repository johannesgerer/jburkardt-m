function sparse_count_test025 ( dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% SPARSE_COUNT_TEST025 tests CFN_E_SIZE_TOTAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
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
  fprintf ( 1, 'TEST025\n' );
  fprintf ( 1, '  CFN_E_SIZE_TOTAL returns the number of\n' );
  fprintf ( 1, '  points in a CFN_E sparse grid made from \n' );
  fprintf ( 1, '  any closed fully nested family of 1D quadrature\n' );
  fprintf ( 1, '  rules with exponential growth, including:\n' );
  fprintf ( 1, '  * CC_E, the Clenshaw Curtis Exponential Growth family;\n' );
  fprintf ( 1, '  * NCC_E, the Newton Cotes Closed Exponential Growth family.\n' );
  fprintf ( 1, '  No reduction is made because of repeated points.\n' );
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
      point_num = cfn_e_size_total ( dim_num, level_max );
      fprintf ( 1, '  %10d', point_num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
