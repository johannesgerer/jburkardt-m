function w_nd = product_weight_herm ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% PRODUCT_WEIGHT_HERM: weights for a product Gauss-Hermite rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D Gauss-Hermite rules of varying order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
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
%    Output, real W_ND(1,ORDER_ND), the product rule weights.
%
  w_nd = ones ( 1, order_nd );

  for dim = 1 : dim_num

    w_1d = hermite_weights ( order_1d(dim) );

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );

  end

  return
end
