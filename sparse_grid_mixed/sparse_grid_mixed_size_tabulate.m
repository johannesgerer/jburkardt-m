function sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, ...
   dim_min, dim_max, level_max_min, level_max_max )

%****************************************************************************80
%
%% SPARSE_GRID_MIXED_SIZE_TABULATE tests SPARSE_GRID_MIXED_SIZE.
%
%  Discussion:
%
%    We do NOT consider mixed rules.  Instead, we are looking at sparse grid
%    rules for which all dimensions use the same 1D rule family.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RULE_1D, the 1D rule.
%
%    Input, real ALPHA_1D, BETA_1D, the optional parameters.
%
%    Input, integer DIM_MIN, the minimum spatial dimension.
%
%    Input, integer DIM_MAX, the maximum spatial dimension.
%
%    Input, integer LEVEL_MAX_MIN, the minimum value of LEVEL_MAX.
%
%    Input, integer LEVEL_MAX_MAX, the maximum value of LEVEL_MAX.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE_TABULATE\n' );
  fprintf ( 1, '  SPARSE_GRID_MIXED_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a sparse grid.\n' );

  if ( rule_1d == 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Here we report the total number of polynomials of\n' )
    fprintf ( 1, '  degree DEGREE or less in the given DIM dimensional space.\n' );
    fprintf ( 1, '  (This is essentially Pascal''s triangle.)\n' );
    fprintf ( 1, '\n' );

    fprintf ( 1, '   DIM: ' );
    for dim_num = dim_min : dim_max
      fprintf ( 1, '  %8d', dim_num );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '      DEGREE\n' );
    fprintf ( 1, '\n' );

    degree_max = 2 * level_max_max + 1;

    for degree = 0 : degree_max

      fprintf ( 1, '    %4d', degree );

      for dim_num = dim_min : dim_max

        point_num = i4_choose ( dim_num + degree, dim_num );

        fprintf ( 1, '  %8d', point_num );

      end

      fprintf ( 1, '\n' );

    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, '  We use the same rule in all dimensions, and count the points\n' );
    fprintf ( 1, '  for a range of dimensions and levels.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  1D rule index is %d\n', rule_1d );
    fprintf ( 1, '  ALPHA parameter is %f\n', alpha_1d );
    fprintf ( 1, '  BETA parameter is  %f\n', beta_1d );
    fprintf ( 1, '\n' );

    tol = sqrt ( eps );

    fprintf ( 1, '   DIM: ' );
    for dim_num = dim_min : dim_max
      fprintf ( 1, '  %8d', dim_num );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '   LEVEL_MAX\n' );
    fprintf ( 1, '\n' );

    for level_max = level_max_min : level_max_max

      fprintf ( 1, '    %4d', level_max );

      for dim_num = dim_min : dim_max

        rule(1:dim_num) = rule_1d;
        alpha(1:dim_num) = alpha_1d;
        beta(1:dim_num) = beta_1d;

        point_num = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, ...
          beta, tol );

        fprintf ( 1, '  %8d', point_num );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
