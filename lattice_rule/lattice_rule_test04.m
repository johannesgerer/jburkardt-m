function lattice_rule_test04 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST04 tests FIBONACCI_LATTICE_Q1;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST04\n' );
  fprintf ( 1, '  FIBONACCI_LATTICE_Q1 applies a Fibonacci lattice rule\n' );
  fprintf ( 1, '  to integrate a function over the unit square.\n' );
  fprintf ( 1, '  A nonlinear coordinate transformation is applied.\n' );
  fprintf ( 1, '  These Fibonacci rules are only available in 2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );

  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;

  exact = e_01_2d ( dim_num, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         K         M    EXACT       ESTIMATE    ERROR\n' );
  fprintf ( 1, '\n' );

  for k = 3 : 18

    quad = fibonacci_lattice_q1 ( k, @f_01_2d );

    error = abs ( exact - quad );
    m = fibonacci ( k );

    fprintf ( 1, '  %8d  %8d  %10.6f  %10.6f  %10.6e\n', k, m, exact, quad, error );

  end

  return
end
