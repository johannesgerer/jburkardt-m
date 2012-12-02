function test_int_2d_test02 ( )

%*****************************************************************************80
%
%% TEST_INT_2D_TEST02 applies a product of composite midpoint rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_2D_TEST02\n' );
  fprintf ( 1, '  Apply a product of composite midpoint rules.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeatedly multiply the number of points by 16.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1,'   Problem      Points      Approx          Error\n' );

  for problem = 1 : problem_num

    fprintf ( 1, '\n' );

    nx = 1;
    ny = 1;

    for i = 1 : 12

      n = nx * ny;

      x = zeros ( 2, n );

      [ a, b ] = p00_lim ( problem );

      k = 0;

      for ix = 1 : nx

        xval = ( ( 2 * nx - 2 * ix + 1 ) * a(1)   ...
               + (          2 * ix - 1 ) * b(1) ) ...
               / ( 2 * nx              );

        for iy = 1 : ny

          yval = ( ( 2 * ny - 2 * iy + 1 ) * a(2)   ...
                 + (          2 * iy - 1 ) * b(2) ) ...
                 / ( 2 * ny              );

          k = k + 1;
          x(1,k) = xval;
          x(2,k) = yval;

        end

      end

      volume = prod ( b(1:2) - a(1:2) );

      fx = p00_fun ( problem, n, x );

      quad = volume * sum ( fx(1:n) ) / n;

      exact = p00_exact ( problem );

      error = abs ( quad - exact );

      fprintf ( 1, '  %8d  %10d  %14e  %14e\n', ...
        problem, n, quad, error );

      nx = nx * 2;
      ny = ny * 2;

    end

    fprintf ( 1, '  %8d       Exact  %14e\n', ...
      problem, exact );

  end

  return
end
