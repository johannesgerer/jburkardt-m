function point_num = sgmga_size ( dim_num, level_weight, level_max, rule, ...
  growth, np, p, tol )

%*****************************************************************************80
%
%% SGMGA_SIZE sizes an SGMGA grid, discounting duplicate points.
%
%  Discussion:
%
%    The sparse grid is the logical sum of product grids that satisfy
%    a particular constraint.
%
%    Depending on the 1D rules involved, there may be many duplicate points
%    in the sparse grid.
%
%    This routine counts the unique points in the sparse grid.  It does this
%    in a straightforward way, by actually generating all the points, and
%    comparing them, with a tolerance for equality.
%
%    This function has been modified to automatically omit points for which
%    the "combinatorial coefficient" is zero, since such points would have
%    a weight of zero in the grid.
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
%    Input, real TOL, the tolerance for point equality.
%
%    Output, integer POINT_NUM, the number of unique points
%    in the grid.
%

%
%  Special cases.
%
  if ( level_max < 0 )
    point_num = -1;
    return
  end

  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  Get total number of points, including duplicates.
%
  point_total_num = sgmga_size_total ( dim_num, level_weight, level_max, ...
    rule, growth );
%
%  Generate SPARSE_TOTAL_ORDER and SPARSE_TOTAL_INDEX arrays
%  for the TOTAL set of points.
%
  sparse_total_order = zeros(dim_num,point_total_num);
  sparse_total_index = zeros(dim_num,point_total_num);

  point_total_num2 = 0;
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
  level_1d = [];
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
%
%  The inner loop generates a POINT of the GRID of the LEVEL.
%
    point_index = [];
    more_points = 0;

    while ( 1 )

      [ point_index, more_points ] = vec_colex_next3 ( dim_num, order_1d, ...
        point_index, more_points );

      if ( ~more_points )
        break
      end

      point_total_num2 = point_total_num2 + 1;
      sparse_total_order(1:dim_num,point_total_num2) = order_1d(1:dim_num);
      sparse_total_index(1:dim_num,point_total_num2) = point_index(1:dim_num);

    end

  end
%
%  Now compute the coordinates of the TOTAL set of points.
%
  sparse_total_point = zeros(dim_num,point_total_num);
  sparse_total_point(1:dim_num,1:point_total_num) = r8_huge ( );

  level_weight_min_pos = r8vec_min_pos ( dim_num, level_weight );
  q_max = level_max * level_weight_min_pos;

  p_index = 1;

  level_1d_max = zeros(dim_num,1);
  
  for dim = 1 : dim_num

    if ( 0 < level_weight(dim) )
      level_1d_max(dim) = floor ( q_max / level_weight(dim) ) + 1;
      if ( q_max <= ( level_1d_max(dim) - 1 ) * level_weight(dim) )
        level_1d_max(dim) = level_1d_max(dim) - 1;
      end
    else
      level_1d_max(dim) = 0;
    end
    
    for level = 0 : level_1d_max(dim)

      order = level_growth_to_order ( 1, level, rule(dim), growth(dim) );

      if ( rule(dim) == 1 )
        points = clenshaw_curtis_compute_points ( order );
      elseif ( rule(dim) == 2 )
        points = fejer2_compute_points ( order );
      elseif ( rule(dim) == 3 )
        points = patterson_lookup_points ( order );
      elseif ( rule(dim) == 4 )
        points = legendre_compute_points ( order );
      elseif ( rule(dim) == 5 )
        points = hermite_compute_points ( order );
      elseif ( rule(dim) == 6 )
        alpha = p(p_index);
        points = gen_hermite_compute_points ( order, alpha );
      elseif ( rule(dim) == 7 ) 
        points = laguerre_compute_points ( order );
      elseif ( rule(dim) == 8 )
        alpha = p(p_index);
        points = gen_laguerre_compute_points ( order, alpha );
      elseif ( rule(dim) == 9 )
        alpha = p(p_index);
        beta = p(p_index+1);
        points = jacobi_compute_points ( order, alpha, beta );
      elseif ( rule(dim) == 10 )
        points = hermite_genz_keister_lookup_points ( order );
      elseif ( rule(dim) == 11 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SGMGA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 11.\n' );
        error ( 'SGMGA_SIZE - Fatal error!' );
      elseif ( rule(dim) == 12 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SGMGA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 12.\n' );
        error ( 'SGMGA_SIZE - Fatal error!' );
      else
        fprintf ( 1,'\n' );
        fprintf ( 1, 'SGMGA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
        error ( 'SGMGA_SIZE - Fatal error!' );
      end

      index = find ( sparse_total_order(dim,1:point_total_num) == order );
      
      sparse_total_point(dim,index) = points ( sparse_total_index(dim,index) );

    end

    p_index = p_index + np(dim);

  end
%
%  Count the tolerably unique columns.
%
  seed = 123456789;

  [ point_num, seed ] = point_radial_tol_unique_count ( dim_num, ...
    point_total_num, sparse_total_point, tol, seed );

  return
end
