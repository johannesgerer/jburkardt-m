function cycle_floyd_test03 ( )

%*****************************************************************************80
%
%% CYCLE_FLOYD_TEST03 tests CYCLE_FLOYD for F3.
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
  fprintf ( 1, 'CYCLE_FLOYD_TEST03\n' );
  fprintf ( 1, '  Test CYCLE_FLOYD for F3().\n' );
  fprintf ( 1, '  f3(i) = mod ( 123 * i + 456, 100000 ).\n' );

  x0 = 789;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting argument X0 = %d\n', x0 );

  [ lam, mu ] = cycle_floyd ( @f3, x0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported cycle length is %d\n', lam );
  fprintf ( 1, '  Expected value is 50000\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported distance to first cycle element is %d\n', mu );
  fprintf ( 1, '  Expected value is 0\n' );

  return
end
