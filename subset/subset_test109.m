function subset_test109 ( )

%*****************************************************************************80
%
%% TEST109 tests POWER_MOD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST109\n' );
  fprintf ( 1, '  POWER_MOD computes the remainder of a power\n' );
  fprintf ( 1, '  of an integer modulo another integer.\n' );

  a = 7;
  n = 50;
  m = 11;

  x = power_mod ( a, n, m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = %d\n', a );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  mod ( A^N, M ) = %d\n', x );

  a = 3;
  n = 118;
  m = 119;

  x = power_mod ( a, n, m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = %d\n', a );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  mod ( A^N, M ) = %d\n', x );

  return
end
