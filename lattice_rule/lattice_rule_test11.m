function lattice_rule_test11 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST11 tests MONTE_CARLO;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST11\n' );
  fprintf ( 1, '  MONTE_CARLO applies a Monte Carlo scheme\n' );
  fprintf ( 1, '  to estimate the integral of a function\n' );
  fprintf ( 1, '  over the unit hypercube.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );

  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;

  exact = e_01_2d ( dim_num, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         M    EXACT       ESTIMATE  ERROR\n' );
  fprintf ( 1, '\n' );

  for k = 2 : 5

    m = 10^k;

    quad = monte_carlo ( dim_num, m, @f_01_2d );

    error = abs ( exact - quad );

    fprintf ( 1, '  %8d  %10.6f  %10.6f  %10.6e\n', m, exact, quad, error );

  end

  return
end
