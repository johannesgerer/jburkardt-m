function sparse_grid_composite_test05 ( dim_num, level_max, degree_max )

%*****************************************************************************80
%
%% SPARSE_GRID_COMPOSITE_TEST05 tests a composite sparse grid rule for monomial exactness.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
%    Input, integer DEGREE_MAX, the maximum monomial total degree to check.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_COMPOSITE_TEST05\n' );
  fprintf ( 1, '  Check the exactness of a composite sparse grid quadrature rule,\n' );
  fprintf ( 1, '  applied to all monomials of orders 0 to DEGREE_MAX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The maximum total degree to be checked is DEGREE_MAX = %d\n', degree_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We expect this rule to be accurate up to and including total degree %d\n', ...
    1 );
%
%  Determine the number of points in the rule.
%
  point_num = sparse_grid_composite_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point] = sparse_grid_composite ( dim_num, level_max, point_num );
%
%  Rescale the weights, and translate the abscissas.
%
  volume = 2.0^dim_num;

  grid_weight(1:point_num) = grid_weight(1:point_num) / volume;

  grid_point(1:dim_num,1:point_num) = ( grid_point(1:dim_num,1:point_num) + 1.0 ) / 2.0; 
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

      quad_error = monomial_quadrature ( dim_num, expon, point_num, grid_weight, grid_point );
      
      fprintf ( 1, '  %12f    %2d      ', quad_error, degree );

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
