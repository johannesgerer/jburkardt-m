function product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta )

%*****************************************************************************80
%
%% PRODUCT_MIXED_WEIGHT_TEST computes the weights of a mixed factor product rule.
%
%  Discussion:
%
%    This routine gets the sparse grid indices and determines the
%    corresponding sparse grid weights.
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
%    Input, integer ORDER_1D(DIM_NUM), the order of the 1D rules.
%
%    Input, integer ORDER_ND, the order of the product rule.
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
      weight_sum_exact = weight_sum_exact * r8_gamma ( 0.5 * ( alpha(dim) + 1.0 ) );
    elseif ( rule(dim) == 7 )
      weight_sum_exact = weight_sum_exact * 1.0;
    elseif ( rule(dim) == 8 )
      weight_sum_exact = weight_sum_exact * r8_gamma ( alpha(dim) + 1.0 );
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
      fprintf ( 1, 'PRODUCT_MIXED_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to handle rule 10.\n' );
      error ( 'PRODUCT_MIXED_WEIGHT_TEST - Fatal error!' );
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
      fprintf ( 1, 'PRODUCT_MIXED_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'PRODUCT_MIXED_WEIGHT_TEST - Fatal error!' );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRODUCT_MIXED_WEIGHT_TEST:\n' );
  fprintf ( 1, '  Compute the weights of a mixed factor product grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly %f\n', weight_sum_exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dimension      Rule     Order        Alpha          Beta\n' );
  fprintf ( 1, '\n' );

  for dim = 1 : dim_num
    fprintf ( 1, '  %8d  %8d  %8d', dim, rule(dim), order_1d(dim) );
    if ( rule(dim) == 6 | rule(dim) == 8 | rule(dim) == 9 )
      fprintf ( 1, '  %12e', alpha(dim) );
    end
    if ( rule(dim) == 9 )
      fprintf ( 1, '  %12e', beta(dim) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Compute the weights and points.
%
  weight = product_mixed_weight ( dim_num, order_1d, order_nd, rule, alpha, beta );
%
%  Sum the weights.
%
  weight_sum = sum ( weight(1:order_nd) );

  weight_sum_error = abs ( weight_sum - weight_sum_exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Weight sum  Expected sum    Difference\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14e  %14e  %14e\n', ...
    weight_sum, weight_sum_exact, weight_sum_error );

  return
end
