function w_nd = product_weights_composite ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% PRODUCT_WEIGHTS_COMPOSITE computes weights for a composite product rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D closed rules of varying order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
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
%    Output, real W_ND(DIM_NUM,ORDER_ND), the product rule weights.
%
  w_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    w_1d = composite_weights ( order_1d(dim) );

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );
 
  end

  return
end
