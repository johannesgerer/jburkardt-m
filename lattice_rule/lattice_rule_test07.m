function lattice_rule_test07 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST07 tests LATTICE.
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
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994, page 18.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST07\n' );
  fprintf ( 1, '  LATTICE applies a lattice rule to integrate\n' );
  fprintf ( 1, '  a function over the unit hypercube.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  The lattice rule order M will vary.\n' );

  z(1:dim_num) = [ 1, 2 ];
  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;

  i4vec_print ( dim_num, z, '  The lattice generator vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         M    EXACT       ESTIMATE    ERROR\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    m = prime ( 3 * i );

    quad = lattice ( dim_num, m, z, @f_01_2d );

    exact = e_01_2d ( dim_num, a, b );

    error = abs ( exact - quad );

    fprintf ( 1, '  %8d  %8d  %10.6f  %10.6f  %10.6e\n', i, m, exact, quad, error );

  end

  return
end
