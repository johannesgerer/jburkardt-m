function [ grid_order, grid_point ] = gl_grids_minmax ( dim_num, q_min, ...
  q_max, grid_num, point_num )

%*****************************************************************************80
%
%% GL_GRIDS_MINMAX computes CC orders and grids with Q_MIN <= Q <= Q_MAX.
%
%  Discussion:
%
%    The necessary dimensions of GRID_ORDER and GRID_POINT can be
%    determined by calling GL_GRIDS_MINMAX first.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer Q_MIN, Q_MAX, the minimum and maximum values of
%    Q, the sum of the orders in each spatial coordinate.
%
%    Input, integer GRID_NUM, the number of Gauss-Legendre
%    grids whose Q value is between Q_MIN and Q_MAX.
%
%    Input, integer POINT_NUM, the total number of points in the grids.
%
%    Output, integer GRID_ORDER(DIM_NUM,GRID_NUM), contains, for each
%    grid, the order of the Clenshaw-Curtis rule in each dimension.
%
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), contains
%    a list of all the abscissas of all the rules, listed one grid at
%    a time.  If a point occurs in several grids, it will be listed
%    several times.
%

%
%  Outer loop generates Q's from Q_MIN to Q_MAX.
%
  point_num = 0;
  grid_num = 0;

  for q = q_min : q_max
%
%  Middle loop generates next partition that adds up to Q.
%
    more = 0;
    order_1d = [];

    while ( 1 )

      [ order_1d, more ] = compnz_next ( q, dim_num, order_1d, more );
%
%  Inner (hidden) loop generates all GL points corresponding to given grid.
%
      order_nd = prod ( order_1d(1:dim_num) );

      grid_point(1:dim_num,point_num+1:point_num+order_nd) = gl_grid ( ...
        dim_num, order_1d, order_nd );

      point_num = point_num + order_nd;

      grid_num = grid_num + 1;
      grid_order(1:dim_num,grid_num) = order_1d(1:dim_num);

      if ( ~more )
        break
      end

    end

  end

  return
end
