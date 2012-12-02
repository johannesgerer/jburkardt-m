function lattice_rule_test08 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST08 tests LATTICE.
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
%    Oxford, 1994, page 18.
%
  dim_num = 2;
  m = 53;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST08\n' );
  fprintf ( 1, '  LATTICE applies a lattice rule to integrate\n' );
  fprintf ( 1, '  a function over the unit hypercube.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  The lattice rule order M is fixed at %d\n', m );
  fprintf ( 1, '  The lattice generator vector Z will vary.\n' );

  z(1) = 1;
  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '         M      Z(1)      Z(2)    EXACT       ESTIMATE    ERROR\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m - 1

    z(2) = i;

    quad = lattice ( dim_num, m, z, @f_01_2d );

    exact = e_01_2d ( dim_num, a, b );

    error = abs ( exact - quad );

    fprintf ( 1, '  %8d  %8d  %8d  %10.6f  %10.6f  %10.6e\n', m, z(1), z(2), exact, quad, error );

  end

  return
end
