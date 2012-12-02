function test_nint_test05 ( )

%*****************************************************************************80
%
%% TEST05 demonstrates how a base point can be moved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  test_num = 5;
  dim_num = 2;
  problem_index = [ 16, 17, 18, 19, 31 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  Demonstrate problems that use a "base point"\n' );
  fprintf ( 1, '  by moving the base point around.\n' );
  fprintf ( 1, '  Use a Monte Carlo rule on box regions.\n' );
  fprintf ( 1, '  Use a fixed spatial dimension.\n' );
  
  for test = 1 : test_num

    problem = problem_index(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem number = %d\n', problem );

    p00_default ( problem, dim_num );

    for run = 1 : 3

      z = [];
      z = p00_r8vec ( problem, 'R', 'Z', dim_num, z );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Run number %d\n', run );
      fprintf ( 1, '  Basis point Z = ( %f, %f )\n', z(1:dim_num) );
      fprintf ( 1, '\n' );
      fprintf ( 1, ...
        '  Prob   Dim    Points    Approx        Exact           Error\n' );
      fprintf ( 1, '\n' );

      for i = 1 : 3
  
        if ( i == 1 )
          points_num = 10;
        elseif ( i == 2 )
          points_num = 1000;
        elseif ( i == 3 )
          points_num = 100000;
        end

        result = p00_box_mc ( problem, dim_num, points_num );

        exact = p00_exact ( problem, dim_num );

        if ( exact == r8_huge ( ) ) then

          fprintf ( 1, '  %4d  %4d  %10d  %14f  %s  %s\n', ...
            problem, dim_num, points_num, result, ...
            '--------------', '--------------' );

        else

          error = abs ( result - exact );

          fprintf ( 1, '  %4d  %4d  %10d  %14f  %14f  %14f\n', ...
            problem, dim_num, points_num, result, exact, error );

        end

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
