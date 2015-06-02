function laguerre_test_int_test05 ( )

%*****************************************************************************80
%
%% LAGUERRE_TEST_INT_TEST05 tests P00_RAT_TRANSFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_TEST_INT_TEST05\n' );
  fprintf ( 1, '  P00_RAT_TRANSFORM. applies a rational tranform\n' );
  fprintf ( 1, '  to estimate an integral on [ALPHA,+oo)\n' );
  fprintf ( 1, '  as a transformed integral on (0,1/(1+ALPHA)]\n' );
  fprintf ( 1, '  and applying a Gauss-Legendre rule.\n' );

  problem_num = p00_problem_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                           Exact\n' );
  fprintf ( 1, '   Problem     Order       Estimate    Error\n' );

  for problem = 1 : problem_num

    exact = p00_exact ( problem );

    order = 1;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d            %14.6f\n', problem, exact );

    for order_log = 0 : 6

      estimate = p00_rat_transform ( problem, order );

      err = abs ( exact - estimate );

      fprintf ( 1, '            %8d  %14.6f  %14.6e\n', order, estimate, err );

      order = order * 2;

    end

  end

  return
end
