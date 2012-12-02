function weight_nd = sgmga_product_weight ( dim_num, order_1d, order_nd, ...
  rule, np, p )

%*****************************************************************************80
%
%% SGMGA_PRODUCT_WEIGHT computes the weights of a mixed product rule.
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
%    09 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial 
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
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
%    Output, real WEIGHT_ND(ORDER_ND), the product rule weights.
%
  weight_nd(1:order_nd) = 1.0;
  p_index = 1;

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
      alpha = p(p_index);
      weight_1d = gen_hermite_compute_weights ( order_1d(dim), alpha );
    elseif ( rule(dim) == 7 )
      weight_1d = laguerre_compute_weights ( order_1d(dim) );
    elseif ( rule(dim) == 8 )
      alpha = p(p_index);
      weight_1d = gen_laguerre_compute_weights ( order_1d(dim), alpha );
    elseif ( rule(dim) == 9 )
      alpha = p(p_index);
      beta = p(p_index+1);
      weight_1d = jacobi_compute_weights ( order_1d(dim), alpha, beta );
    elseif ( rule(dim) == 10 )
      weight_1d = hermite_genz_keister_lookup_weights ( order_1d(dim) );
    elseif ( rule(dim) == 11 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to set weights for rule 11.\n' );
      error ( 'SGMGA_PRODUCT_WEIGHT - Fatal error!' );
    elseif ( rule(dim) == 12 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT - Fatal error!\n' );
      fprintf ( 1, '  Do not know how to set weights for rule 12.\n' );
      error ( 'SGMGA_PRODUCT_WEIGHT - Fatal error!' );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'SGMGA_PRODUCT_WEIGHT - Fatal error!' );
    end

    weight_nd = r8vec_direct_product2 ( dim, order_1d(dim), weight_1d, ...
      dim_num, order_nd, weight_nd );
 
    p_index = p_index + np(dim);

  end

  return
end
