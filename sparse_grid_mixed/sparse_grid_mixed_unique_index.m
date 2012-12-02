function sparse_unique_index = sparse_grid_mixed_unique_index ( dim_num, ...
  level_max, rule, alpha, beta, tol, point_num, point_total_num )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_UNIQUE_INDEX maps nonunique points to unique points.
%
%  Discussion:
%
%    The sparse grid usually contains many points that occur in more
%    than one product grid.
%
%    When generating the point locations, it is easy to realize that a point
%    has already been generated.
%
%    But when it's time to compute the weights of the sparse grids, it is
%    necessary to handle situations in which weights corresponding to
%    the same point generated in multiple grids must be collected together.
%
%    This routine generates ALL the points, including their multiplicities,
%    and figures out a mapping from them to the collapsed set of unique points.
%
%    This mapping can then be used during the weight calculation so that
%    a contribution to the weight gets to the right place.
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
%    Input, real TOL, the tolerance for point equality.
%
%    Input, integer POINT_NUM, the number of unique points in the grid.
%
%    Input, integer POINT_TOTAL_NUM, the total number of points in the grid.
%
%    Output, integer SPARSE_UNIQUE_INDEX(POINT_TOTAL_NUM), lists, for each
%    (nonunique) point, the corresponding index of the same point in the
%    unique listing.
%

%
%  Special cases.
%
  if ( level_max < 0 )
    sparse_unique_index = [];
    return
  end

  if ( level_max == 0 )
    sparse_unique_index(1) = 1;
    return
  end
%
%  Generate SPARSE_TOTAL_ORDER and SPARSE_TOTAL_INDEX arrays for the TOTAL set of points.
%
  sparse_total_order = zeros ( dim_num, point_total_num );
  sparse_total_index = zeros ( dim_num, point_total_num );

  point_total_num2 = 0;
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

      if ( ~more_grids )
        break
      end

    end

  end
%
%  Now compute the coordinates of the TOTAL set of points.
%
  sparse_total_point = zeros ( dim_num, point_total_num );
  sparse_total_point(1:dim_num,1:point_total_num) = r8_huge ( );

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
        fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Do not know how to assign points for rule 10.\n' );
        error ( 'SPARSE_GRID_MIXED_SIZE - Fatal error!' );
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
        fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
        error ( 'SPARSE_GRID_MIXED_SIZE - Fatal error!' );
      end

      index = find ( sparse_total_order(dim,1:point_total_num) == order );

      sparse_total_point(dim,index) = points ( sparse_total_index(dim,index) );

    end

  end
%
%  Now determine the mapping from nonunique points to unique points.
%  We can not really use the UNDX output right now.
%
  [ undx, sparse_unique_index ] = r8col_undex ( dim_num, point_total_num, ...
    sparse_total_point, point_num, tol );

  return
end
