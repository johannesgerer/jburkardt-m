function lattice_rule_test12 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST12 tests LATTICE_PRINT.
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
  m = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST12\n' );
  fprintf ( 1, '  LATTICE_PRINT prints out the lattice generated\n' );
  fprintf ( 1, '  by a single generator vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );

  z(1:dim_num) = [ 1, 3 ];

  i4vec_print ( dim_num, z, '  The generator vector:' );

  lattice_print ( dim_num, m, z, '  The total lattice:' );

  return
end
