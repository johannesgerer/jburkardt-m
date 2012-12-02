function cycle_brent_test02 ( )

%*****************************************************************************80
%
%% CYCLE_BRENT_TEST02 tests CYCLE_BRENT for F2.
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
  fprintf ( 1, 'CYCLE_BRENT_TEST02\n' );
  fprintf ( 1, '  Test CYCLE_BRENT for F2().\n' );
  fprintf ( 1, '  f2(i) = mod ( 22 * i + 1, 72 ).\n' );

  x0 = 0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting argument X0 = %d\n', x0 );

  [ lam, mu ] = cycle_brent ( @f2, x0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported cycle length is %d\n', lam );
  fprintf ( 1, '  Expected value is 9\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported distance to first cycle element is %d\n', mu );
  fprintf ( 1, '  Expected value is 3\n' );

  return
end
