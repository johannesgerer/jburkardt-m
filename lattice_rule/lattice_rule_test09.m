function lattice_rule_test09 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST09 tests LATTICE_NP0;
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
%    Oxford, 1994, page 78-80, pages 32-40, 145-147.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST09\n' );
  fprintf ( 1, '  LATTICE_NP0 applies a lattice rule to a\n' );
  fprintf ( 1, '  nonperiodic function by reflecting the function\n' );
  fprintf ( 1, '  about the midpoint and averaging.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );

  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;

  exact = e_01_2d ( dim_num, a, b );

  z(1:dim_num) = [ 1, 2 ];
  i4vec_print ( dim_num, z, '  The lattice generator vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         M    EXACT       ESTIMATE    ERROR\n' );
  fprintf ( 1, '\n' );

  for k = 3 : 18

    m = fibonacci ( k );

    quad = lattice_np0 ( dim_num, m, z, @f_01_2d );

    error = abs ( exact - quad );

    fprintf ( 1, '  %8d  %10.6f  %10.6f  %10.6e\n', m, exact, quad, error );

  end

  return
end
