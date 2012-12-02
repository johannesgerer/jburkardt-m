function [ point, weight ] = gl_grid_square ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% GL_GRID_SQUARE returns a "square" multidimensional Gauss-Legendre grid.
%
%  Discussion:
%
%    For a "square" grid, we simply assume that the same order 
%    one dimensional rule is used in all dimensions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension of the points.
%
%    Input, integer ORDER_1D, the order of the 1D rule.
%
%    Input, integer ORDER_ND, the DIM_NUM power of ORDER_1D, the
%    total number of points in the grid.
%
%    Output, real POINT(DIM_NUM,ORDER_ND), the points in the grid.
%
%    Output, real WEIGHT(ORDER_ND), the weights of the points.
%
  [ xtab, wtab ] = legendre_compute ( order_1d );

  a = [];
  more = 0;
  p = 0;

  while ( 1 )

    [ a, more ] = vec_next ( dim_num, order_1d, a, more );

    p = p + 1;
    point(1:dim_num,p) = xtab(a(1:dim_num)+1);
    weight(p) = prod ( wtab(a(1:dim_num)+1) );
    
    if ( ~more )
      break
    end

  end

  return
end
