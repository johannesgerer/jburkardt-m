function sparse_point = sgmga_point ( dim_num, level_weight, level_max, ...
  rule, growth, np, p, point_num, sparse_order, sparse_index )

%*****************************************************************************80
%
%% SGMGA_POINT computes the points of an SGMGA rule.
%
%  Discussion:
%
%    The sparse grid is the logical sum of low degree product rules.
%
%    Each product rule is the product of 1D factor rules.
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the weighting of each level.
%    * the level that defines the Smolyak grid.
%    * the quadrature rules.
%    * the number of points.
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
%    Input, integer LEVEL_MAX, controls the size of the final
%    sparse grid.
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
%    Input, integer POINT_NUM, the number of unique points
%    in the grid.
%
%    Input, integer SPARSE_ORDER(DIM_NUM,POINT_NUM), lists, for
%    each point, the order of the 1D rules used in the grid that generated it.
%
%    Input, integer SPARSE_INDEX(DIM_NUM,POINT_NUM), lists, for
%    each point, its index in each of the 1D rules in the grid that generated
%    it.  The indices are 1-based.
%
%    Output, real SPARSE_POINT(DIM_NUM,POINT_NUM), the points.
%

%
%  Compute the point coordinates.
%
  sparse_point(1:dim_num,1:point_num) = - r8_huge ( );

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
        fprintf ( 1, 'SGMGA_POINT - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 11.\n' );
        error ( 'SGMGA_POINT - Fatal error!' );
      elseif ( rule(dim) == 12 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SGMGA_POINT - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 12.\n' );
        error ( 'SGMGA_POINT - Fatal error!' );
      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SGMGA_POINT - Fatal error!\n' );
        fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
        error ( 'SGMGA_POINT - Fatal error!' );
      end

      for point = 1 : point_num
        if ( sparse_order(dim,point) == order )
          sparse_point(dim,point) = points ( sparse_index(dim,point) );
        end
      end

    end

    p_index = p_index + np(dim);

  end
%
%  Check to see if we missed any points.
%
  for point = 1 : point_num
    for dim = 1 : dim_num
      if ( sparse_point(dim,point) == - r8_huge ( ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SGMGA_POINT - Fatal error!\n' );
        fprintf ( 1, '  At least one point component was not assigned.\n' );
        fprintf ( 1, '  POINT = %d\n', point );
        fprintf ( 1, '  DIM = %d\n', dim );
        fprintf ( 1, '  SPARSE_ORDER(DIM,POINT) = %d\n', sparse_order(dim,point) );
        fprintf ( 1, '  LEVEL_WEIGHT(DIM) = %f\n', level_weight(dim) );
        error ( 'SGMGA_POINT - Fatal error!' );
      end
    end
  end

  return
end
