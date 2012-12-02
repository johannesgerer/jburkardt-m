function sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p )

%****************************************************************************80
%
%% SGMGA_PRODUCT_WEIGHT_TEST: mixed factor product rule test.
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
%    Input, integer ORDER_1D(DIM_NUM), the order of the 1D rules.
%
%    Input, integer ORDER_ND, the order of the product rule.
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
%    Input, integer NP(DIM_NUM), the number of parameters used by each rule.
%
%    Input, real P(*), the parameters needed by each rule.
%
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
      weight_sum_exact = weight_sum_exact * gamma ( 0.5 *( alpha + 1.0 ) );
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
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to handle rule 11.\n' )
      error ( 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!' );
    elseif ( rule(dim) == 12 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to handle rule 12.\n' )
      error ( 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!' );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!' );
    end

    p_index = p_index + np(dim);

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TEST:\n' );
  fprintf ( 1, '  Compute the weights of a mixed factor product grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly %f\n', weight_sum_exact );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dimension      Rule     Order        Parmeters\n' );
  fprintf ( 1, '\n' );

  p_index = 1;

  for dim = 1 : dim_num

    if ( rule(dim) == 1 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 2 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 3 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 4 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 5 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 6 )
     fprintf ( 1, '  %8d  %8d  %8d  %14f\n', dim, rule(dim), order_1d(dim), ...
        p(p_index) );
    elseif ( rule(dim) == 7 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 8 )
     fprintf ( 1, '  %8d  %8d  %8d  %14f\n', dim, rule(dim), order_1d(dim), ...
       p(p_index) );
    elseif ( rule(dim) == 9 )
     fprintf ( 1, '  %8d  %8d  %8d  %14f  %14f\n', dim, rule(dim), ...
       order_1d(dim), p(p_index), p(p_index+1) );
    elseif ( rule(dim) == 10 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 11 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    elseif ( rule(dim) == 12 )
      fprintf ( 1, '  %8d  %8d  %8d\n', dim, rule(dim), order_1d(dim) );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SGMGA_PRODUCT_WEIGHT_TEST - Fatal error!' );
    end

    p_index = p_index + np(dim);

  end
%
%  Compute the weights.
%
  weight = sgmga_product_weight ( dim_num, order_1d, order_nd, rule, np, p );
%
%  Sum the weights.
%
  weight_sum = sum ( weight(1:order_nd) );

  weight_sum_error = abs ( weight_sum - weight_sum_exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Weight sum  Expected sum    Difference\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14f  %14f  %14e\n', weight_sum, weight_sum_exact, ...
    weight_sum_error );

  return
end
