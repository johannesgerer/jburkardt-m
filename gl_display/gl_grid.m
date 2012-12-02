function [ point, weight ] = gl_grid ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% GL_GRID returns a multidimensional Gauss-Legendre grid.
%
%  Discussion:
%
%    For this grid, we allow each dimension to have a specific
%    and possibly distinct quadrature order.
%
%    If all the orders are the same, use GL_GRID_SQUARE instead
%    for a more efficient calculation.
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
%    Input, integer ORDER_1D(DIM_NUM), the orders of the 1D rules.
%
%    Input, integer ORDER_ND, the product of the entries of ORDER_1D,
%    the total number of points in the grid.
%
%    Output, real POINT(DIM_NUM,ORDER_ND), the points in the grid.
%
%    Output, real WEIGHT(ORDER_ND), the weights of the points.
%
  off = 0;

  for dim = 1 : dim_num
    [ xtab(off+1:off+order_1d(dim)), wtab(off+1:off+order_1d(dim)) ] ...
      = legendre_compute ( order_1d(dim) );
    off = off + order_1d(dim);
  end

  p = 0;

  ones_1d(1:dim_num) = 1;
  rank = 0;
  a = [];

  while ( 1 )

    [ rank, a ] = tuple_next2 ( dim_num, ones_1d, order_1d, rank, a );

    if ( rank == 0 )
      break
    end

    p = p + 1;
    off = 0;
    weight(p) = 1.0;

    for dim = 1 : dim_num
      point(dim,p) = xtab(a(dim)+off);
      weight(p) = weight(p) * wtab(a(dim)+off);
      off = off + order_1d(dim);
    end
    
  end

  return
end
