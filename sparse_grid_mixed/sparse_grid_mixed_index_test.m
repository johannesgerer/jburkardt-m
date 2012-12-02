function sparse_grid_mixed_index_test ( dim_num, level_max_min, ...
  level_max_max, rule, alpha, beta, tol )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_INDEX_TEST tests SPARSE_GRID_MIXED_INDEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2011
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
  fprintf ( 1, 'SPARSE_GRID_MIXED_INDEX_TEST\n' );
  fprintf ( 1, '  SPARSE_GRID_MIXED_INDEX returns index and order vectors that\n' );
  fprintf ( 1, '  identify each point in a multidimensional sparse grid with mixed factors.\n' );
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

  for level_max = level_max_min : level_max_max

    point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule );

    point_num = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, ...
      beta, tol );

    sparse_unique_index = sparse_grid_mixed_unique_index ( ...
      dim_num, level_max, rule, alpha, beta, tol, point_num, point_total_num );

    [ sparse_order, sparse_index ] = sparse_grid_mixed_index ( ...
      dim_num, level_max, rule, point_num, point_total_num, sparse_unique_index );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  For LEVEL_MAX = %d\n', level_max );
    fprintf ( 1, '\n' );
    for point = 1 : point_num
      fprintf ( 1, '  %4d:    ', point );
      for dim = 1 : dim_num
        fprintf ( 1, '  %3d / %3d,', sparse_index(dim,point), sparse_order(dim,point) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
