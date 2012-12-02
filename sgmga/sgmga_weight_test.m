function sgmga_weight_test ( dim_num, importance, level_weight, ...
  level_max_min, level_max_max, rule, growth, np, p, tol )

%****************************************************************************80
%
%% SGMGA_WEIGHT_TEST checks the sum of the quadrature weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real IMPORTANCE(DIM_NUM), the anisotropic importance
%    for each dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weight
%    for each dimension.
%
%    Input, integer LEVEL_MAX_MIN, LEVEL_MAX_MAX, the minimum and
%    maximum values of LEVEL_MAX.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested.
%     2, "F2",  Fejer Type 2, Open Fully Nested.
%     3, "GP",  Gauss Patterson, Open Fully Nested.
%     4, "GL",  Gauss Legendre, Open Weakly Nested.
%     5, "GH",  Gauss Hermite, Open Weakly Nested.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested.
%     7, "LG",  Gauss Laguerre, Open Non Nested.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested.
%     9, "GJ",  Gauss Jacobi, Open Non Nested.
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH(DIM_NUM), the growth in each dimension.
%    0, "DF", default growth associated with this quadrature rule;
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Input, integer NP(DIM_NUM), the number of parameters used by each rule.
%
%    Input, real P(*), the parameters needed by each rule.
%
%    Input, real TOL, a tolerance for point equality.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_WEIGHT_TEST:\n' );
  fprintf ( 1, '  Compute the weights of a sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each sparse grid is of spatial dimension DIM_NUM,\n' );
  fprintf ( 1, '  and is made up of product grids of levels up to LEVEL_MAX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  IMPORTANCE:    ');
  for dim = 1 : dim_num
    fprintf ( 1, '  %14f', importance(dim) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_WEIGHT:  ');
  for dim = 1 : dim_num
    fprintf ( 1, '  %14f', level_weight(dim) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dimension      Rule       Growth     Parameters\n' );
  fprintf ( 1, '\n' );

  p_index = 1;

  for dim = 1 : dim_num

    if ( rule(dim) == 1 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  2 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  3 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  4 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  5 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  6 )
      fprintf ( 1, '  %8d  %8d  %11d  %14f\n', dim, rule(dim), growth(dim), p(p_index) );
    elseif ( rule(dim) ==  7 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) ==  8 )
      fprintf ( 1, '  %8d  %8d  %11d  %14f\n', dim, rule(dim), growth(dim), p(p_index) );
    elseif ( rule(dim) ==  9 )
      fprintf ( 1, '  %8d  %8d  %11d  %14f  %14f\n', ...
        dim, rule(dim), growth(dim), p(p_index), p(p_index+1) );
    elseif ( rule(dim) == 10 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) == 11 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    elseif ( rule(dim) == 12 )
      fprintf ( 1, '  %8d  %8d  %11d\n', dim, rule(dim), growth(dim) );
    end

    p_index = p_index + np(dim);

  end

  weight_sum_exact = 1.0;

  p_index = 1;

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
      alpha = p(p_index);
      weight_sum_exact = weight_sum_exact * gamma ( 0.5 * ( alpha + 1.0 ) );
    elseif ( rule(dim) == 7 ) 
      weight_sum_exact = weight_sum_exact * 1.0;
    elseif ( rule(dim) == 8 )
      alpha = p(p_index);
      weight_sum_exact = weight_sum_exact * gamma ( alpha + 1.0 );
    elseif ( rule(dim) == 9 )
      alpha = p(p_index);
      beta = p(p_index+1);
      arg1 = - alpha;
      arg2 = 1.0;
      arg3 = beta + 2.0;
      arg4 = - 1.0;
      value1 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );
      arg1 = - beta;
      arg2 = 1.0;
      arg3 = alpha + 2.0;
      arg4 = - 1.0;
      value2 = r8_hyper_2f1 ( arg1, arg2, arg3, arg4 );
      weight_sum_exact = weight_sum_exact * ( ...
        value1 / ( beta + 1.0 ) + value2 / ( alpha + 1.0 ) );
    elseif ( rule(dim) == 10 )
      weight_sum_exact = weight_sum_exact * sqrt ( pi );
    elseif ( rule(dim) == 11 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to deal with RULE = 11.\n' );
      error ( 'SGMGA_WEIGHT_TEST - Fatal error!' );
    elseif ( rule(dim) == 12 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to deal with RULE = 12.\n' );
      error ( 'SGMGA_WEIGHT_TEST - Fatal error!' );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SGMGA_WEIGHT_TEST - Fatal error!' );
    end

    p_index = p_index + np(dim);

  end

  fprintf ( 1, '\n' );
  fprintf ( 1,'  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly %f\n', weight_sum_exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Level      Weight sum  Expected sum    Difference\n' );
  fprintf ( 1, '\n' );

  for level_max = level_max_min : level_max_max

    point_total_num = sgmga_size_total ( dim_num, level_weight, level_max, ...
      rule, growth );

    point_num = sgmga_size ( dim_num, level_weight, level_max, rule, growth, ...
      np, p, tol );

    sparse_unique_index = sgmga_unique_index ( dim_num, level_weight, ...
      level_max, rule, growth, np, p, tol, point_num, point_total_num );

    [ sparse_order, sparse_index ] = sgmga_index ( dim_num, level_weight, ...
      level_max, rule, growth, point_num, point_total_num, sparse_unique_index );

    sparse_weight = sgmga_weight ( dim_num, level_weight, level_max, rule, ...
      growth, np, p, point_num, point_total_num, sparse_unique_index );

    weight_sum = sum ( sparse_weight(1:point_num) );

    weight_sum_error = abs ( weight_sum - weight_sum_exact );

    fprintf ( 1, '  %8d  %14f  %14f  %14e\n', ...
      level_max, weight_sum, weight_sum_exact, weight_sum_error );

  end

  return
end
