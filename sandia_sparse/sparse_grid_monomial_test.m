function sparse_grid_monomial_test ( rule, dim_num, level_max, degree_max )

%*****************************************************************************80
%
%% SPARSE_GRID_MONOMIAL_TEST tests monomial exactness of the sparse grid rules.
%
%  Discussion:
%
%    This test is going to check EVERY monomial of total degree DEGREE_MAX
%    or less.  Even for a moderately high dimension of DIM_NUM = 10, you
%    do NOT want to use a large value of DEGREE_MAX, since there are
%
%      1         monomials of total degree 0,
%      DIM_NUM   monomials of total degree 1,
%      DIM_NUM^2 monomials of total degree 2,
%      DIM_NUM^3 monomials of total degree 3, and so on.
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
%  Parameters:
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
%    Input, integer DEGREE_MAX, the maximum monomial total
%    degree to check.
%
  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MONOMIAL_TEST\n' );
  fprintf ( 1, '  Check the exactness of a sparse grid quadrature rule,\n' );
  fprintf ( 1, '  applied to all monomials of orders 0 to DEGREE_MAX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For cases where the dimension is greater than 1,\n' );
  fprintf ( 1, '  many sparse grid of this level have accuracy through\n' );
  fprintf ( 1, '  monomials of total degree   %d\n', 2 * level_max + 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  LEVEL_MIN =                 %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX =                 %d\n', level_max );
  fprintf ( 1, '  1D quadrature index RULE =  %d\n', rule );
  fprintf ( 1, '  Check up to DEGREE_MAX =    %d\n', degree_max );
%
%  Determine the number of points in the rule.
%
  point_num = levels_index_size ( dim_num, level_max, rule );

  fprintf ( 1, '  Unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point ] = sparse_grid ( dim_num, level_max, rule, ...
    point_num );
%
%  Compare exact and estimated values of the integrals of various monomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Error      Total   Monomial\n' );
  fprintf ( 1, '                 Degree  Exponents\n' );
  fprintf ( 1, '\n' );

  for degree = 0 : degree_max

    expon = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ expon, more, h, t ] = comp_next ( degree, dim_num, expon, more, h, t );

      quad_error = monomial_quadrature ( dim_num, expon, point_num, ...
        grid_weight, grid_point, rule );

      fprintf ( 1, '  %14e  %2d  ', quad_error, degree );
      for dim = 1 : dim_num
        fprintf ( 1, '%2d', expon(dim) );
      end
      fprintf ( 1, '\n' );

      if ( ~more )
        break
      end

    end

    if ( 1 < dim_num )
      fprintf ( 1, '\n' );
    end

  end

  return
end
