function sparse_grid_hermite_test05 ( dim_num, level_max, degree_max )

%*****************************************************************************80
%
%% TEST05 tests a Gauss-Hermite sparse grid rule for monomial exactness.
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
%    05 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
%    Input, integer DEGREE_MAX, the maximum monomial total degree to check.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  Check the exactness of a Gauss-Hermite sparse grid \n' );
  fprintf ( 1, '  quadrature rule, applied to all monomials of orders \n' );
  fprintf ( 1, '  0 to DEGREE_MAX.\n' );

  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MIN = %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The maximum total degree to check is DEGREE_MAX = %d\n', ...
    degree_max );
%
%  Determine the number of points in the rule.
%
  point_num = sparse_grid_herm_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point] = sparse_grid_herm ( dim_num, level_max, ...
    point_num );
%
%  Explore the monomials.
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
        grid_weight, grid_point );

      fprintf ( 1, '  %12e    %2d      ', quad_error, degree );

      for dim = 1 : dim_num
        fprintf ( 1, '%2d', expon(dim) );
      end
      fprintf ( 1, '\n' );

      if ( ~more )
        break;
      end

    end

    fprintf ( 1, '\n' );

  end

  return
end

