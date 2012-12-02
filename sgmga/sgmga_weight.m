function sparse_weight = sgmga_weight ( dim_num, level_weight, level_max, ...
  rule, growth, np, p, point_num, point_total_num, sparse_unique_index )

%*****************************************************************************80
%
%% SGMGA_WEIGHT computes weights for an SGMGA rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2011
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
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial 
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weights.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested.
%     2, "F2",  Fejer Type 2, Open Fully Nested.
%     3, "GP",  Gauss Patterson, Open Fully Nested.
%     4, "GL",  Gauss Legendre, Open Weakly Nested.
%     5, "GH",  Gauss Hermite, Open Weakly Nested.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested.
%     7, "LG",  Gauss Laguerre, Open Non Nested.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested.
%     9, "GJ",  Gauss Jacobi, Open Non Nested.
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH(DIM_NUM), the growth in each dimension.
%    0, "DF", default growth associated with this quadrature rule;
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Input, integer NP(DIM_NUM), the number of parameters used by each rule.
%
%    Input, real P(*), the parameters needed by each rule.
%
%    Input, integer POINT_NUM, the number of unique points in
%    the grid.
%
%    Input, integer POINT_TOTAL_NUM, the total number of points
%    in the grid.
%
%    Input, integer SPARSE_UNIQUE_INDEX(POINT_TOTAL_NUM), lists,
%    for each (nonunique) point, the corresponding index of the same point in
%    the unique listing.
%
%    Output, real SPARSE_WEIGHT(POINT_NUM), the weights
%    associated with the sparse grid points.
%
  sparse_weight = zeros ( point_num, 1 );

  point_total = 0;
%
%  Initialization for SGMGA_VCN_ORDERED.
%
  level_weight_min_pos = r8vec_min_pos ( dim_num, level_weight );
  q_min = level_max * level_weight_min_pos - sum ( level_weight(1:dim_num) );
  q_max = level_max * level_weight_min_pos;
  level_1d_max = zeros ( dim_num, 1 );
  for dim = 1 : dim_num
    if ( 0.0 < level_weight(dim) )
      level_1d_max(dim) = floor ( q_max / level_weight(dim) ) + 1;
      if ( q_max <= ( level_1d_max(dim) - 1 ) * level_weight(dim) )
        level_1d_max(dim) = level_1d_max(dim) - 1;
      end
    else
      level_1d_max(dim) = 0;
    end
  end
  more_grids = 0;
  level_1d = zeros ( dim_num, 1 );
%
%  Seek all vectors LEVEL_1D which satisfy the constraint:
%
%    LEVEL_MAX * LEVEL_WEIGHT_MIN_POS - sum ( LEVEL_WEIGHT ) 
%      < sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * LEVEL_1D(I)
%      <= LEVEL_MAX * LEVEL_WEIGHT_MIN_POS.
%
  while ( 1 )

    [ level_1d, more_grids ] = sgmga_vcn_ordered ( dim_num, level_weight, ...
      level_1d_max, level_1d, q_min, q_max, more_grids );

    if ( ~more_grids )
      break
    end
%
%  Compute the combinatorlal coefficient.
%
    coef = sgmga_vcn_coef ( dim_num, level_weight, level_1d, q_max );

    if ( coef == 0.0 )
      continue
    end

    order_1d = level_growth_to_order ( dim_num, level_1d, rule, growth );
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
    grid_weight = sgmga_product_weight ( dim_num, order_1d, order_nd, rule, ...
      np, p );
%
%  Add these weights to the rule.
%
    for order = 1 : order_nd

      point_total = point_total + 1;

      point_unique = sparse_unique_index(point_total);

      sparse_weight(point_unique) = sparse_weight(point_unique) ...
        + coef * grid_weight(order);

    end

  end

  return
end
