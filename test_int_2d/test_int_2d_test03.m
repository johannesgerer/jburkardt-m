function test_int_2d_test03 ( )

%*****************************************************************************80
%
%% TEST_INT_2D_TEST03 applies a product of Gauss-Legendre rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_2D_TEST03\n' );
  fprintf ( 1, '  Use a product of Gauss-Legendre rules.\n' );
  fprintf ( 1, '  The 1D rules essentially double in order.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem      Points       Approx         Error\n' );

  for problem = 1 : problem_num

    fprintf ( 1, '\n' );

    nx = 1;
    ny = 1;

    for i = 1 : 8

      [ x, w ] = legendre_dr_compute ( nx );

      nxy = nx * ny;

      wxy = zeros ( nxy, 1 );
      xy = zeros ( 2, nxy );

      [ a, b ] = p00_lim ( problem );

      k = 0;

      for ix = 1 : nx

        xval = ( ( 1.0 + x(ix) ) * a(1)   ...
               + ( 1.0 - x(ix) ) * b(1) ) ...
               /   2.0;

        for iy = 1 : ny

          yval = ( ( 1.0 + x(iy) ) * a(2)   ...
                 + ( 1.0 - x(iy) ) * b(2) ) ...
                 /   2.0;

          k = k + 1;
          xy(1,k) = xval;
          xy(2,k) = yval;
          wxy(k) = w(ix) * w(iy);

        end

      end

      volume = ( b(1) - a(1) ) * ( b(2) - a(2) );

      fxy = p00_fun ( problem, nxy, xy );

      quad = volume * ( wxy' * fxy  ) / 4.0;

      exact = p00_exact ( problem );

      error = abs ( quad - exact );

      fprintf ( 1, '  %8d  %10d  %14g  %14g\n', problem, nxy, quad, error );

      nx = 2 * nx + 1;
      ny = nx;

    end

    fprintf ( 1, '  %8d       Exact  %14g\n', problem, exact );

  end

  return
end
