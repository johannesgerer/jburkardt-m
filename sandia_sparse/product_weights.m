function w_nd = product_weights ( dim_num, order_1d, order_nd, rule )

%*****************************************************************************80
%
%% PRODUCT_WEIGHTS computes the weights of a product rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D open rules of varying order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2008
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
%    Input, integer RULE, the index of the rule.
%    1, "CC", Clenshaw Curtis Closed Fully Nested rule.
%    2, "F1", Fejer 1 Open Fully Nested rule.
%    3, "F2", Fejer 2 Open Fully Nested rule.
%    4, "GP", Gauss Patterson Open Fully Nested rule.
%    5, "GL", Gauss Legendre Open Weakly Nested rule.
%    6, "GH", Gauss Hermite Open Weakly Nested rule.
%    7, "LG", Gauss Laguerre Open Non Nested rule.
%
%    Output, real W_ND(DIM_NUM,ORDER_ND), the product rule weights.
%
  w_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    if ( rule == 1 )
      w_1d = cc_weights ( order_1d(dim) );
    elseif ( rule == 2 )
      w_1d = f1_weights ( order_1d(dim) );
    elseif ( rule == 3 )
      w_1d = f2_weights ( order_1d(dim) );
    elseif ( rule == 4 )
      w_1d = gp_weights ( order_1d(dim) );
    elseif ( rule == 5 )
      w_1d = gl_weights ( order_1d(dim) );
    elseif ( rule == 6 )
      w_1d = gh_weights ( order_1d(dim) );
    elseif ( rule == 7 )
      w_1d = lg_weights ( order_1d(dim) );
    end

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );
 
  end

  return
end
