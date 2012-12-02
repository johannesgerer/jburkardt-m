function sparse_weight = sparse_grid_mixed_weight ( dim_num, level_max, ...
  rule, alpha, beta, point_num, point_total_num, sparse_unique_index )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_WEIGHT computes sparse grid weights based on a mix of 1D rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
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
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested rule.
%     2, "F2",  Fejer Type 2, Open Fully Nested rule.
%     3, "GP",  Gauss Patterson, Open Fully Nested rule.
%     4, "GL",  Gauss Legendre, Open Weakly Nested rule.
%     5, "GH",  Gauss Hermite, Open Weakly Nested rule.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested rule.
%     7, "LG",  Gauss Laguerre, Open Non Nested rule.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested rule.
%     9, "GJ",  Gauss Jacobi, Open Non Nested rule.
%    10, "GW",  Golub Welsch, (presumed) Open Non Nested rule.
%    11, "CC_SE", Clenshaw Curtis Slow Exponential, Closed Fully Nested rule.
%    12, "F2_SE", Fejer Type 2 Slow Exponential, Closed Fully Nested rule.
%    13, "GP_SE", Gauss Patterson Slow Exponential, Closed Fully Nested rule.
%    14, "CC_ME", Clenshaw Curtis Moderate Exponential, Closed Fully Nested rule.
%    15, "F2_ME", Fejer Type 2 Moderate Exponential, Closed Fully Nested rule.
%    16, "GP_ME", Gauss Patterson Moderate Exponential, Closed Fully Nested rule.
%    17, "CCN", Clenshaw Curtis Nested, Linear, Closed Fully Nested rule.
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters used for
%    Generalized Gauss Hermite, Generalized Gauss Laguerre, and Gauss Jacobi rules.
%
%    Input, integer POINT_NUM, the number of unique points in the grid.
%
%    Input, integer POINT_TOTAL_NUM, the total number of points in the grid.
%
%    Input, integer SPARSE_UNIQUE_INDEX(POINT_TOTAL_NUM), lists, for each
%    (nonunique) point, the corresponding index of the same point in the
%    unique listing.
%
%    Output, real SPARSE_WEIGHT(POINT_NUM), the weights
%    associated with the sparse grid points.
%
  sparse_weight(1:point_num) = 0.0;

  point_total = 0;

  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more_grids = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more_grids, h, t ] = comp_next ( level, dim_num, level_1d, ...
        more_grids, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_default ( dim_num, level_1d, rule );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Compute the weights for this grid.
%
%  The correct transfer of data from the product grid to the sparse grid
%  depends on the fact that the product rule weights are stored under colex
%  order of the points, and this is the same ordering implicitly used in
%  generating the SPARSE_UNIQUE_INDEX array.
%
      grid_weight = product_mixed_weight ( dim_num, order_1d, order_nd, ...
        rule, alpha, beta );
%
%  Compute Smolyak's binomial coefficient for this grid.
%
      coeff = r8_mop ( level_max - level ) ...
        * r8_choose ( dim_num - 1, level_max - level );
%
%  Add these weights to the rule.
%
      for order = 1 : order_nd

        point_total = point_total + 1;

        point_unique = sparse_unique_index(point_total);

        sparse_weight(point_unique) = sparse_weight(point_unique) ...
          + coeff * grid_weight(order);

      end

      if ( ~more_grids )
        break
      end

    end

  end

  return
end
