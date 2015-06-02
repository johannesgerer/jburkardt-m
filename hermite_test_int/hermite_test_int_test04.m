function hermite_test_int_test04 ( )

%*****************************************************************************80
%
%% HERMITE_TEST_INT_TEST04 tests P00_TURING
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST_INT_TEST04\n' );
  fprintf ( 1, '  P00_TURING applies a Turing procedure\n' );
  fprintf ( 1, '  to estimate an integral on (-oo,+oo).\n' );

  problem_num = p00_problem_num ( );

  m = 4;
  p06_param ( 'S', 'M', m );

  for test = 1 : 2

    if ( test == 1 )
      tol = 1.0E-04;
    elseif ( test == 2 )
      tol = 1.0E-07;
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using a tolerance of TOL = %f\n', tol );
    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '   Problem      H              N      Estimate    Exact    Error\n' );

    for problem = 1 : problem_num

      exact = p00_exact ( problem );

      h = 1.0;

      fprintf ( 1, '\n' );

      for order_log = 0 : 6

        [ n, estimate ] = p00_turing ( problem, h, tol );

        err = abs ( exact - estimate );

        fprintf ( 1, '  %8d  %10f  %8d  %14.6f  %14.6f  %14.6e\n', ...
          problem, h, 2*n+1, estimate, exact, err );

        h = h / 2.0;

      end

    end

  end

  return
end
