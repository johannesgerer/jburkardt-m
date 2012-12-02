function cycle_floyd_test04 ( )

%*****************************************************************************80
%
%% CYCLE_FLOYD_TEST04 tests CYCLE_FLOYD for F4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CYCLE_FLOYD_TEST04\n' );
  fprintf ( 1, '  Test CYCLE_FLOYD for F4().\n' );
  fprintf ( 1, '  f4(i) = mod ( 31421 * i + 6927, 65536 ).\n' );

  x0 = 1;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting argument X0 = %d\n', x0 );

  [ lam, mu ] = cycle_floyd ( @f4, x0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported cycle length is %d\n', lam );
  fprintf ( 1, '  Expected value is 65536\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported distance to first cycle element is %d\n', mu );
  fprintf ( 1, '  Expected value is 0\n' );

  return
end
