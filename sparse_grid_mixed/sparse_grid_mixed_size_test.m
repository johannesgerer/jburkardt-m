function sparse_grid_mixed_size_test ( dim_num, level_max_min, ...
  level_max_max, rule, alpha, beta, tol )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_SIZE_TEST tests SPARSE_GRID_MIXED_SIZE, SPARSE_GRID_MIXED_SIZE_TOTAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX_MIN, LEVEL_MAX_MAX, the minimum and
%    maximum values of LEVEL_MAX.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested rule.
%     2, "F2",  Fejer Type 2, Open Fully Nested rule.
%     3, "GP",  Gauss Patterson, Open Fully Nested rule.
%     4, "GL",  Gauss Legendre, Open Weakly Nested rule.
%     5, "GH",  Gauss Hermite, Open Weakly Nested rule.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested rule.
%     7, "LG",  Gauss Laguerre, Open Non Nested rule.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested rule.
%     9, "GJ",  Gauss Jacobi, Open Non Nested rule.
%    10, "GW",  Golub Welsch, (presumed) Open Non Nested rule.
%    11, "CC_SE", Clenshaw Curtis Slow Exponential, Closed Fully Nested rule.
%    12, "F2_SE", Fejer Type 2 Slow Exponential, Closed Fully Nested rule.
%    13, "GP_SE", Gauss Patterson Slow Exponential, Closed Fully Nested rule.
%    14, "CC_ME", Clenshaw Curtis Moderate Exponential, Closed Fully Nested rule.
%    15, "F2_ME", Fejer Type 2 Moderate Exponential, Closed Fully Nested rule.
%    16, "GP_ME", Gauss Patterson Moderate Exponential, Closed Fully Nested rule.
%    17, "CCN", Clenshaw Curtis Nested, Linear, Closed Fully Nested rule.
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters used for
%    Generalized Gauss Hermite, Generalized Gauss Laguerre, and Gauss Jacobi rules.
%
%    Input, real TOL, the tolerance for point equality.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE_TEST\n' );
  fprintf ( 1, '  SPARSE_GRID_MIXED_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a multidimensional sparse grid with mixed factors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPARSE_GRID_MIXED_SIZE_TOTAL returns the number of \n' );
  fprintf ( 1, '  points in a multidimensional sparse grid with mixed factors\n' );
  fprintf ( 1, '  without checking for duplication.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each sparse grid is of spatial dimension DIM_NUM,\n' );
  fprintf ( 1, '  and is made up of product grids of levels up to LEVEL_MAX.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dimension      Rule     Alpha          Beta\n' );
  fprintf ( 1, '\n' );

  for dim = 1 : dim_num
    fprintf ( 1, '  %8d  %8d', dim, rule(dim) );
    if ( rule(dim) == 6 | rule(dim) == 8 | rule(dim) == 9 )
      fprintf ( 1, '  %12e', alpha(dim) );
    end
    if ( rule(dim) == 9 )
      fprintf ( 1, '  %12e', beta(dim) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, ' LEVEL_MIN LEVEL_MAX POINT_NUM POINT_NUM\n' );
  fprintf ( 1, '                        Unique     Total\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max

    point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule );

    point_num = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, ...
      beta, tol );

    level_min = max ( 0, level_max + 1 - dim_num );

    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', ...
      level_min, level_max, point_num, point_total_num );

  end

  return
end
