function test_nint_test06 ( )

%*****************************************************************************80
%
%% TEST06 applies a composite midpoint rule for increasing spatial dimension.
%
%  Modified:
%
%    13 August 2008
%
%  Author:
%
%    John Burkardt
%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  Use a simple product rule on a box region.\n' );
  fprintf ( 1, '  Use a fixed problem;\n' );
  fprintf ( 1, '  Let the spatial dimension increase.\n' );

  problem = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Prob   Dim  Subs    Approx         Exact        Error        Calls\n' );
  fprintf ( 1, '\n' );

  for dim_num = 1 : 4

    p00_default ( problem, dim_num );

    for sub_num = 1 : 2 : 5

      calls = 0;
      p00_i4 ( problem, 'S', '#', calls );

      result = p00_box_gl05 ( problem, dim_num, sub_num );

      calls = p00_i4 ( problem, 'G', '#', calls );

      exact = p00_exact ( problem, dim_num );

      if ( exact == r8_huge ( ) )

        fprintf ( 1, '  %4d  %4d  %4d  %12f  %s  %s  %12d\n', ...
          problem, dim_num, sub_num, result, ...
          '--------------', '----------', calls );

      else

        error = abs ( result - exact );

        fprintf ( 1, '  %4d  %4d  %4d  %12f  %12f  %12f  %12d\n', ...
          problem, dim_num, sub_num, result, exact, error, calls );

      end

    end

    fprintf ( 1, '\n' );

  end

  return
end
