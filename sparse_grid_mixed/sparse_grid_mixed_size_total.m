function point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_SIZE sizes a sparse grid, counting duplicate points.
%
%  Discussion:
%
%    The sparse grid is the logical sum of product grids with total LEVEL
%    between LEVEL_MIN and LEVEL_MAX.
%
%    In some cases, the same point may occur in different product grids
%    used to form the sparse grid.
%
%    This routine counts the total number of points used to construct the sparse
%    grid; if the same point occurs several times, each occurrence is added
%    to the sum.
%
%    This computation is useful in order to be able to allocate enough
%    space for the full set of points, before they are compressed by removing
%    duplicates.
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
%    Output, integer POINT_TOTAL_NUM, the total number of points in the grid.
%

%
%  Special case.
%
  if ( level_max == 0 )
    point_total_num = 1;
    return
  end

  point_total_num = 0;
%
%  The outer loop generates values of LEVEL.
%
  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max
%
%  The middle loop generates a GRID,
%  based on the next partition that adds up to LEVEL.
%
    level_1d = [];
    more_grids = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more_grids, h, t ] = comp_next ( level, dim_num, level_1d, ...
        more_grids, h, t );

      order_1d = level_to_order_default ( dim_num, level_1d, rule );

      point_total_num = point_total_num + prod ( order_1d(1:dim_num) );

      if ( ~more_grids )
        break
      end

    end

  end

  return
end
