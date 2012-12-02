function test_int_2d_test01 ( )

%*****************************************************************************80
%
%% TEST_INT_2D_TEST01 applies a Monte Carlo rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_2D_TEST01\n' );
  fprintf ( 1, '  Use a Monte Carlo rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeatedly multiply the number of points by 16.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1,'   Problem      Points      Approx          Error\n' );

  for problem = 1 : problem_num

    fprintf ( 1, '\n' );

    n = 1;

    for i = 1 : 12

      seed = 123456789;
      rand ( 'state', seed );
      x = rand ( 2, n );
%
%  R8MAT_UNIFORM_01 is horribly inefficient compared to RAND.
%
%     [ x, seed ] = r8mat_uniform_01 ( 2, n, seed );

      [ a, b ] = p00_lim ( problem );

      for dim = 1 : 2
        x(dim,1:n) = ( 1.0 - x(dim,1:n) ) * a(dim) ...
                   +         x(dim,1:n)   * b(dim);
      end

      volume = prod ( b(1:2) - a(1:2) );

      fx = p00_fun ( problem, n, x );

      quad = volume * sum ( fx(1:n) ) / n;

      exact = p00_exact ( problem );

      error = abs ( quad - exact );

      fprintf ( 1, '  %8d  %10d  %14e  %14e\n', ...
        problem, n, quad, error );

      n = n * 4;

    end

    fprintf ( 1, '  %8d       Exact  %14e\n', ...
      problem, exact );

  end

  return
end
