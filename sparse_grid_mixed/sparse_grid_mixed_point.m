function sparse_point = sparse_grid_mixed_point ( dim_num, level_max, ...
  rule, alpha, beta, point_num, sparse_order, sparse_index )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_POINT computes the points of a sparse grid rule.
%
%  Discussion:
%
%    The sparse grid is the logical sum of low degree product rules.
%
%    Each product rule is the product of 1D factor rules.
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
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
%    Input, integer LEVEL_MAX, controls the size of the final
%    sparse grid.
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
%    Input, integer SPARSE_ORDER(DIM_NUM,POINT_NUM), lists, for each point,
%    the order of the 1D rules used in the grid that generated it.
%
%    Input, integer SPARSE_INDEX(DIM_NUM,POINT_NUM), lists, for each point,
%    its index in each of the 1D rules in the grid that generated it.
%    The indices are 1-based.
%
%    Output, real SPARSE_POINT(DIM_NUM,POINT_NUM), the points.
%

%
%  Compute the point coordinates.
%
  sparse_point = zeros ( dim_num, point_num );
  sparse_point(1:dim_num,1:point_num) = r8_huge ( );

  for dim = 1 : dim_num

    for level = 0 : level_max

      order = level_to_order_default ( 1, level, rule(dim) );

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
        points = gen_hermite_compute_points ( order, alpha(dim) );
      elseif ( rule(dim) == 7 )
        points = laguerre_compute_points ( order );
      elseif ( rule(dim) == 8 )
        points = gen_laguerre_compute_points ( order, alpha(dim) );
      elseif ( rule(dim) == 9 )
        points = jacobi_compute_points ( order, alpha(dim), beta(dim) );
      elseif ( rule(dim) == 10 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SPARSE_GRID_MIXED_POINT - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 10.\n' );
        error ( 'SPARSE_GRID_MIXED_POINT - Fatal error!' );
      elseif ( rule(dim) == 11 )
        points = clenshaw_curtis_compute_points ( order );
      elseif ( rule(dim) == 12 )
        points = fejer2_compute_points ( order );
      elseif ( rule(dim) == 13 )
        points = patterson_lookup_points ( order );
      elseif ( rule(dim) == 14 )
        points = clenshaw_curtis_compute_points ( order );
      elseif ( rule(dim) == 15 )
        points = fejer2_compute_points ( order );
      elseif ( rule(dim) == 16 )
        points = patterson_lookup_points ( order );
      elseif ( rule(dim) == 17 )
        points = ccn_compute_points ( order );
      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SPARSE_GRID_MIXED_POINT - Fatal error!\n' );
        fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
        error ( 'SPARSE_GRID_MIXED_POINT - Fatal error!' );
      end

      index = find ( sparse_order(dim,1:point_num) == order );

      sparse_point(dim,index) = points ( sparse_index(dim,index) );

    end

  end

  return
end

