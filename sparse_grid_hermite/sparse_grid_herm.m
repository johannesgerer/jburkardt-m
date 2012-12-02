function [ grid_weight, grid_point ] = sparse_grid_herm ( dim_num, ...
  level_max, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_HERM computes a sparse grid of Gauss-Hermite points.
%
%  Discussion:
%
%    The quadrature rule is associated with a sparse grid derived from
%    a Smolyak construction using a 1D Gauss-Hermite quadrature rule.
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
%    05 July 2008
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
%    Input, integer POINT_NUM, the number of points in the grid,
%    as determined by SPARSE_GRID_HERM_SIZE.
%
%    Output, real GRID_WEIGHT(1,POINT_NUM), the weights.
%
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), the points.
%
  grid_point = zeros ( dim_num, point_num );
  grid_weight = zeros ( 1, point_num );
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
%  The Gauss-Hermite rule differs from the other OPEN rules only in the nesting behavior.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      grid_base2(1:dim_num) = round ( ( order_1d(1:dim_num) - 1 ) / 2 );
%
%  The product of the 1D orders gives us the number of points in this subgrid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Compute the weights for this product grid.
%
      grid_weight2 = product_weight_herm ( dim_num, order_1d, order_nd );
%
%  Now determine the coefficient of the weight.
%
      coeff = (-1)^( level_max - level ) ...
        * i4_choose ( dim_num - 1, level_max - level );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%  The grid indices will be between -M to +M, where 2*M + 1 = ORDER_1D(DIM).
%
      grid_index2 = multigrid_index_z ( dim_num, order_1d, order_nd );
%
%  Determine the first level of appearance of each of the points.
%  This allows us to flag certain points as being repeats of points
%  generated on a grid of lower level.
%
%  This is SLIGHTLY tricky.
%
      grid_level = index_level_herm ( level, level_max, dim_num, order_nd, ...
        grid_index2, grid_base2 );
%
%  Only keep those points which first appear on this level.
%
      for point = 1 : order_nd
%
%  Either a "new" point (increase count, create point, create weight)
%
        if ( grid_level(point) == level )

          point_num2 = point_num2 + 1;

          grid_point(1:dim_num,point_num2) = hermite_abscissa ( dim_num, 1, ...
            grid_index2(1:dim_num,point), grid_base2(1:dim_num) );

          grid_weight(point_num2) = coeff * grid_weight2(point);
%
%  or an already existing point (create point temporarily, find match,
%  add weight to matched point's weight).
%
        else

          grid_point_temp(1:dim_num) = hermite_abscissa ( dim_num, 1, ...
            grid_index2(1:dim_num,point), grid_base2(1:dim_num) );

          point3 = -1;

          for point2 = 1 : point_num2
            if ( grid_point(1:dim_num,point2) == grid_point_temp(1:dim_num)' )
              point3 = point2;
              break
            end
          end

          if ( point3 == -1 )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'SPARSE_GRID_HERMITE - Fatal error!\n' );
            fprintf ( 1, '  Could not match point.\n' );
            error ( 'SPARSE_GRID_HERMITE - Fatal error!' );
          end

          grid_weight(point3) = grid_weight(point3) ...
            + coeff * grid_weight2(point);

        end

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
