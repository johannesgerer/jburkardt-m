function [ grid_weight, grid_point ] = sparse_grid_own ( dim_num, ...
  level_max, rule, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_OWN computes a sparse grid based on an OWN 1D rule.
%
%  Discussion:
%
%    The 1D quadrature rule is assumed to be Open Weakly Nested.
%    Such rules include Gauss Hermite and Gauss Legendre rules.
%
%    A Smolyak construction is used to create a multidimensional sparse grid.
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid,
%    * the rule;
%    * the number of points.
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
%    as determined by LEVELS_INDEX_SIZE_OWN.
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

  if ( dim_num == 1 )
    level_min2 = level_min;
  else
    level_min2 = 0;
  end

  for level = level_min2 : level_max
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
%  The GL rule differs from the other OPEN rules only in the nesting behavior.
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
      grid_weight2 = product_weights ( dim_num, order_1d, order_nd, rule );
%
%  Now determine the coefficient of the weight.
%
      coeff = r8_mop ( level_max - level ) ...
        * r8_choose ( dim_num - 1, level_max - level );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%  The grid indices will be between -M to +M, where 2*M + 1 = ORDER_1D(DIM).
%
      grid_index2 = multigrid_index_own ( dim_num, order_1d, order_nd );
%
%  Determine the first level of appearance of each of the points.
%  This allows us to flag certain points as being repeats of points
%  generated on a grid of lower level.
%
%  This is SLIGHTLY tricky.
%
      grid_level = index_level_own ( level, level_max, dim_num, order_nd, ...
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

          if ( point_num < point_num2 )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'SPARSE_GRID_OWN - Fatal error!\n' );
            fprintf ( 1, ...
            '  Exceeding maximum point index POINT_NUM = %d\n', point_num );
            error ( 'SPARSE_GRID_OWN - Fatal error!' );
          end

          if ( rule == 5 )
            grid_point(1:dim_num,point_num2) = gl_abscissa ( dim_num, 1, ...
              grid_index2(1:dim_num,point), grid_base2(1:dim_num) );
          elseif ( rule == 6 )
            grid_point(1:dim_num,point_num2) = gh_abscissa ( dim_num, 1, ...
              grid_index2(1:dim_num,point), grid_base2(1:dim_num) );
          else
            fprintf ( 1, '\n' );
            fprintf ( 1, 'SPARSE_GRID_OWN - Fatal error!\n' );
            fprintf ( 1, '  Unrecognized rule number = %d\n', rule );
            error ( 'SPARSE_GRID_OWN - Fatal error!' );
          end

          if ( level_min <= level )
            grid_weight(point_num2) = coeff * grid_weight2(point);
          end
%
%  or an already existing point (create point temporarily, find match,
%  add weight to matched point's weight).
%
        else

          if ( level_min <= level )

            if ( rule == 5 )
              grid_point_temp(1:dim_num) = gl_abscissa ( dim_num, 1, ...
                grid_index2(1:dim_num,point), grid_base2(1:dim_num) );
            elseif ( rule == 6 )
              grid_point_temp(1:dim_num) = gh_abscissa ( dim_num, 1, ...
                grid_index2(1:dim_num,point), grid_base2(1:dim_num) );
            else
              fprintf ( 1, '\n' );
              fprintf ( 1, 'SPARSE_GRID_OWN - Fatal error!\n' );
              fprintf ( 1, '  Unrecognized rule number = %d\n', rule );
              error ( 'SPARSE_GRID_OWN - Fatal error!' );
            end

            point3 = -1;

            for point2 = 1 : point_num2
              if ( all ( grid_point(1:dim_num,point2) == grid_point_temp(1:dim_num)' ) )
                point3 = point2;
                break
              end
            end

            if ( point3 == -1 )
              fprintf ( 1, '\n' );
              fprintf ( 1, 'SPARSE_GRID_OWN - Fatal error!\n' );
              fprintf ( 1, '  Could not match point.\n' );
              error ( 'SPARSE_GRID_OWN - Fatal error!' );
            end

            grid_weight(point3) = grid_weight(point3) ...
              + coeff * grid_weight2(point);

          end

        end

      end

      if ( ~more )
        break
      end

    end

  end

  if ( point_num2 < point_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPARSE_GRID_OWN - Fatal error!\n' );
    fprintf ( 1,'  Set fewer points than POINT_NUM = %d\n', point_num );
    error ( 'SPARSE_GRID_OWN - Fatal error!' );
  end

  return
end
