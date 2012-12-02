function lattice_rule_test14 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST14 tests FIBONACCI_LATTICE_Q_NODES.
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
  k = 12;
  m = fibonacci ( k );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST14\n' );
  fprintf ( 1, '  FIBONACCI_LATTICE_Q_NODES...\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  The Fibonacci index K =   %d\n', k );
  fprintf ( 1, '  The Fibonacci value M =   %d\n', m );
  fprintf ( 1, '\n' );

  x = fibonacci_lattice_q_nodes ( k );

  r8mat_transpose_print ( dim_num, m, x, '  The Fibonacci lattice nodes:' );

  return
end
