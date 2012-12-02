function cycle_brent_test01 ( )

%*****************************************************************************80
%
%% CYCLE_BRENT_TEST01 tests CYCLE_BRENT for a tiny example.
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
  fprintf ( 1, 'CYCLE_BRENT_TEST01\n' );
  fprintf ( 1, '  Test CYCLE_BRENT on F1().\n' );
  fprintf ( 1, '  f1(0) = 6.\n' );
  fprintf ( 1, '  f1(1) = 6.\n' );
  fprintf ( 1, '  f1(2) = 0.\n' );
  fprintf ( 1, '  f1(3) = 1.\n' );
  fprintf ( 1, '  f1(4) = 4.\n' );
  fprintf ( 1, '  f1(5) = 3.\n' );
  fprintf ( 1, '  f1(6) = 3.\n' );
  fprintf ( 1, '  f1(7) = 4.\n' );
  fprintf ( 1, '  f1(8) = 0.\n' );

  x0 = 2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting argument X0 = %d\n', x0 );

  [ lam, mu ] = cycle_brent ( @f1, x0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported cycle length is %d\n', lam );
  fprintf ( 1, '  Expected value is 3\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported distance to first cycle element is %d\n', mu );
  fprintf ( 1, '  Expected value is 2\n' );

  return
end
