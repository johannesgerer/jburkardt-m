function weight_nd = product_mixed_weight ( dim_num, order_1d, order_nd, ...
  rule, alpha, beta )

%*****************************************************************************80
%
%% PRODUCT_MIXED_WEIGHT computes the weights of a mixed product rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D rules of varying order and kind.
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
%    Generalized Hermite, Generalized Laguerre, and Jacobi rules.
%
%    Output, real WEIGHT_ND(ORDER_ND), the product rule weights.
%
  weight_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    if ( rule(dim) == 1 )
      weight_1d = clenshaw_curtis_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 2 )
      weight_1d = fejer2_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 3 )
      weight_1d = patterson_lookup_weights ( order_1d(dim) );
    elseif ( rule(dim) == 4 )
      weight_1d = legendre_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 5 )
      weight_1d = hermite_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 6 )
      weight_1d = gen_hermite_compute_weights ( order_1d(dim), alpha(dim) );
    elseif ( rule(dim) == 7 )
      weight_1d = laguerre_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 8 )
      weight_1d = gen_laguerre_compute_weights ( order_1d(dim), alpha(dim) );
    elseif ( rule(dim) == 9 )
      weight_1d = jacobi_compute_weights ( order_1d(dim), alpha(dim), beta(dim) );
    elseif ( rule(dim) == 10 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_MIXED_WEIGHT - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to set weights for rule 10.\n' );
      error ( 'PRODUCT_MIXED_WEIGHT - Fatal error!' );
    elseif ( rule(dim) == 11 )
      weight_1d = clenshaw_curtis_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 12 )
      weight_1d = fejer2_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 13 )
      weight_1d = patterson_lookup_weights ( order_1d(dim) );
    elseif ( rule(dim) == 14 )
      weight_1d = clenshaw_curtis_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 15 )
      weight_1d = fejer2_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 16 )
      weight_1d = patterson_lookup_weights ( order_1d(dim) );
    elseif ( rule(dim) == 17 )
      weight_1d = ccn_compute_weights ( order_1d(dim) );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRODUCT_MIXED_WEIGHT - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'PRODUCT_MIXED_WEIGHT - Fatal error!' );
    end

    weight_nd = r8vec_direct_product2 ( dim, order_1d(dim), weight_1d, ...
      dim_num, order_nd, weight_nd );

  end

  return
end
