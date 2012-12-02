function [ grid_weight, grid_point ] = sparse_grid_onn ( dim_num, ...
  level_max, rule, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_ONN computes a sparse grid based on a ONN 1D rule.
%
%  Discussion:
%
%    The 1D quadrature rule is assumed to be Open Non-Nested.
%    Such rules include Gauss Laguerre rules.
%
%    A Smolyak construction is used to create a multidimensional sparse grid.
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2008
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
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, controls the size of the
%    sparse grid.
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
%    Input, integer POINT_NUM, the number of points in the grid,
%    as determined by LEVELS_ONN_INDEX_SIZE.
%
%    Output, real GRID_WEIGHT(POINT_NUM), the weights.
%
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), the points.
%
  grid_weight(1:point_num) = 0.0;
  grid_point = zeros ( dim_num, point_num );
%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
  point_num2 = 0;

  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%  The relationship is the same as for other OPEN rules.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      grid_base2(1:dim_num) = order_1d(1:dim_num);
%
%  The product of the 1D orders gives us the number of points in this subgrid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Compute the weights for this product grid.
%
      grid_weight2 = product_weights ( dim_num, order_1d, order_nd, rule );
%
%  Now determine the coefficient of the weight.
%
      coeff = r8_mop ( level_max - level ) ...
        * r8_choose ( dim_num - 1, level_max - level );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%  The grid indices will be between 1 and ORDER_1D(DIM).
%
      grid_index2 = multigrid_index_onn ( dim_num, order_1d, order_nd );

      for point = 1 : order_nd

        point_num2 = point_num2 + 1;

        if ( point_num < point_num2 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'SPARSE_GRID_ONN - Fatal error!\n' );
          fprintf ( 1, ...
          '  Exceeding maximum point index POINT_NUM = %d\n', point_num );
          error ( 'SPARSE_GRID_ONN - Fatal error!' );
        end

        grid_point(1:dim_num,point_num2) = lg_abscissa ( dim_num, 1, ...
          grid_index2(1:dim_num,point), grid_base2(1:dim_num) );

        grid_weight(point_num2) = coeff * grid_weight2(point);

      end

      if ( ~more )
        break
      end

    end

  end

  if ( point_num2 < point_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPARSE_GRID_ONN - Fatal error!\n' );
    fprintf ( 1, '  Set fewer points than POINT_NUM = %d\n', point_num );
    error ( 'SPARSE_GRID_ONN - Fatal error!' );
  end

  return
end
