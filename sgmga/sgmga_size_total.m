function point_total_num = sgmga_size_total ( dim_num, level_weight, ...
  level_max, rule, growth )

%*****************************************************************************80
%
%% SGMGA_SIZE_TOTAL sizes an SGMGA grid, counting duplicate points.
%
%  Discussion:
%
%    This routine returns the total point count for an SGMGA
%    ( Sparse Grid of Mixed type with Growth rule and Anisotropic weights).
%
%    The sparse grid is the logical sum of product grids.
%
%    The sparse grid has an associated integer index LEVEL_MAX, whose lowest
%    value is 0.  LEVEL_MAX = 0 indicates the sparse grid made up of one product
%    grid, which in turn is the product of 1D factor grids of the lowest level.
%    This usually means the sparse grid with LEVEL_MAX equal to 0 is a
%    one point grid.
%
%    We can assign a level to each factor grid, and hence a LEVEL vector
%    to the corresponding product grid, and a weighted index
%    LEVEL_GRID (which will in general be a real number):
%
%      LEVEL_GRID = sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * LEVEL(I)
%
%    The product grid will participate in the formation of the sparse grid
%    if it satisfies the following weighted constraint:
%
%      LEVEL_MAX - DIM_NUM < LEVEL_GRID <= LEVEL_MAX
%
%    This routine determines the total number of abscissas in all the
%    product rules used to form the SGMGA associated with the index LEVEL_MAX.
%    The count disregards duplication.  If the same multidimensional abcsissa
%    occurs in two different product rules that are part of the SGMGA, then
%    that single abcissa is counted twice.
%
%    This computation is useful in cases where the entire set of abscissas
%    is going to be generated, preparatory to compression to finding, indexing
%    and merging the duplicate abcissass.
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
%    Output, integer POINT_TOTAL_NUM, the total number of points
%    in the grid.
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
%  Initialization for SGMGA_VCN_ORDERED.
%
  level_weight_min_pos = r8vec_min_pos ( dim_num, level_weight );
  q_min = level_max * level_weight_min_pos - sum ( level_weight(1:dim_num) );
  q_max = level_max * level_weight_min_pos;
  level_1d_max = zeros(dim_num,1);
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

    coef = sgmga_vcn_coef ( dim_num, level_weight, level_1d, q_max );

    if ( coef == 0.0 )
      continue
    end

    order_1d = level_growth_to_order ( dim_num, level_1d, rule, growth );

    point_total_num = point_total_num + prod ( order_1d(1:dim_num) );

  end

  return
end
