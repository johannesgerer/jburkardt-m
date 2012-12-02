function test_nint_test03 ( )

%*****************************************************************************80
%
%% TEST03 applies a composite midpoint rule to box regions.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  Use a simple product rule on box regions.\n' );
  fprintf ( 1, '  Use a fixed spatial dimension.\n' );

  problem_num = get_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Prob   Dim  Subs       Approx          Exact          Error\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : problem_num

    dim_num = 3;
%
%  Set problem data to default values.
%
    p00_default ( problem, dim_num );
%
%  Get the region type.
%
    region = p00_region ( problem );

    if ( strncmpi ( region, 'box', 3 ) )

      for sub_num = 1 : 2 : 5

        result = p00_box_gl05 ( problem, dim_num, sub_num );

        exact = p00_exact ( problem, dim_num );

        if ( exact == r8_huge ( ) )

          fprintf ( 1, '  %4d  %4d  %4d  %14f  %s  %s\n', ...
            problem, dim_num, sub_num, result, ...
            '--------------', '--------------' );

        else

          error = abs ( result - exact );

          fprintf ( 1, '  %4d  %4d  %4d  %14f  %14f  %14f\n', ...
            problem, dim_num, sub_num, result, exact, error );

        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
