function sparse_grid_mixed_weight_test ( dim_num, level_max_min, ...
  level_max_max, rule, alpha, beta, tol )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_WEIGHT_TEST checks the sum of the quadrature weights.
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
  fprintf ( 1, 'SPARSE_GRID_MIXED_WEIGHT_TEST:\n' );
  fprintf ( 1, '  Compute the weights of a sparse grid.\n' );
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

  weight_sum_exact = 1.0;

  for dim = 1 : dim_num

    if ( rule(dim) == 1 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 2 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 3 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 4 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 5 )
      weight_sum_exact = weight_sum_exact * sqrt ( pi );
    elseif ( rule(dim) == 6 )
      weight_sum_exact = weight_sum_exact * gamma ( 0.5 * ( alpha(dim) + 1.0 ) );
    elseif ( rule(dim) == 7 )
      weight_sum_exact = weight_sum_exact * 1.0;
    elseif ( rule(dim) == 8 )
      weight_sum_exact = weight_sum_exact * gamma ( alpha(dim) + 1.0 );
    elseif ( rule(dim) == 9 )
      arg1 = - alpha(dim);
      arg2 = 1.0;
      arg3 = beta(dim) + 2.0;
      arg4 = - 1.0;
      value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );
      arg1 = - beta(dim);
      arg2 = 1.0;
      arg3 = alpha(dim) + 2.0;
      arg4 = - 1.0;
      value2 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );
      weight_sum_exact = weight_sum_exact * ( ...
        value1 / ( beta(dim) + 1.0 ) + value2 / ( alpha(dim) + 1.0 ) );
    elseif ( rule(dim) == 10 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPARSE_GRID_MIXED_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know weight sum for rule 10.\n' );
      error ( 'SPARSE_GRID_MIXED_WEIGHT_TEST - Fatal error!' );
    elseif ( rule(dim) == 11 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 12 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 13 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 14 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 15 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 16 )
      weight_sum_exact = weight_sum_exact * 2.0;
    elseif ( rule(dim) == 17 )
      weight_sum_exact = weight_sum_exact * 2.0;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPARSE_GRID_MIXED_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SPARSE_GRID_MIXED_WEIGHT_TEST - Fatal error!' );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly %f\n', weight_sum_exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Level      Weight sum  Expected sum    Difference\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max

    point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule );

    point_num  = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, beta, tol );

    sparse_unique_index = sparse_grid_mixed_unique_index ( ...
      dim_num, level_max, rule, alpha, beta, tol, point_num, point_total_num );

    sparse_weight = sparse_grid_mixed_weight ( dim_num, level_max, rule, ...
      alpha, beta, point_num, point_total_num, sparse_unique_index );

    weight_sum = sum ( sparse_weight(1:point_num) );

    weight_sum_error = abs ( weight_sum - weight_sum_exact );

    fprintf ( 1, '  %8d  %14e  %14e  %14e\n', ...
      level_max, weight_sum, weight_sum_exact, weight_sum_error );

  end

  return
end
