function test_nint_test04 ( )

%*****************************************************************************80
%
%% TEST04 applies a Monte Carlo rule to box regions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  Use a Monte Carlo rule on box regions.\n' );
  fprintf ( 1, '  Use a fixed spatial dimension.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeatedly multiply the number of points by 16.\n' );

  problem_num = get_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Prob   Dim    Points     Approx        Exact          Error\n' );
  fprintf ( 1, '\n' );

  dim_num = 3;

  for problem = 1 : problem_num
%
%  Set problem data to default values.
%
    p00_default ( problem, dim_num );
%
%  Get region type.
%
    region = p00_region ( problem );

    if ( strncmpi ( region, 'box', 3 ) )

      for i = 1 : 5

        if ( i == 1 )
          point_num = 1;
        else
          point_num = 16 * point_num;
        end

        seed = 123456789;
        rand ( 'state', seed );

        result = p00_box_mc ( problem, dim_num, point_num );

        exact = p00_exact ( problem, dim_num );

        if ( exact == r8_huge ( ) )

          fprintf ( 1, '  %4d  %4d  %10d  %14f  %s  %s\n', ...
            problem, dim_num, point_num, result, ...
            '--------------', '--------------' );

        else

          error = abs ( result - exact );

          fprintf ( 1, '  %4d  %4d  %10d  %14f  %14f  %14f\n', ...
            problem, dim_num, point_num, result, exact, error );

        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end

