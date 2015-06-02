function hermite_test_int_test03 ( )

%*****************************************************************************80
%
%% HERMITE_TEST_INT_TEST03 tests P00_GAUSS_HERMITE.
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
  fprintf ( 1, 'HERMITE_TEST_INT_TEST03\n' );
  fprintf ( 1, '  P00_GAUSS_HERMITE applies a Gauss-Hermite rule\n' );
  fprintf ( 1, '  to estimate an integral on (-oo,+oo).\n' );

  problem_num = p00_problem_num ( );

  m = 4;
  p06_param ( 'S', 'M', m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Problem     Order       Estimate    Exact    Error\n' );

  for problem = 1 : problem_num

    exact = p00_exact ( problem );

    order = 1;

    fprintf ( 1, '\n' );

    for order_log = 0 : 6

      estimate = p00_gauss_hermite ( problem, order );

      err = abs ( exact - estimate );

      fprintf ( 1, '  %8d  %8d  %14.6f  %14.6f  %14.6e\n', ...
        problem, order, estimate, exact, err );

      order = order * 2;

    end

  end

  return
end
