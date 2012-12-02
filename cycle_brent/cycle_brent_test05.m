function cycle_brent_test05 ( )

%*****************************************************************************80
%
%% CYCLE_BRENT_TEST05 tests CYCLE_BRENT for F5.
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
  fprintf ( 1, 'CYCLE_BRENT_TEST05\n' );
  fprintf ( 1, '  Test CYCLE_BRENT for F5().\n' );
  fprintf ( 1, '  f5(i) = mod ( 16383 * i + 1, 65536 ).\n' );

  x0 = 1;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting argument X0 = %d\n', x0 );

  [ lam, mu ] = cycle_brent ( @f5, x0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported cycle length is %d\n', lam );
  fprintf ( 1, '  Expected value is 8\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reported distance to first cycle element is %d\n', mu );
  fprintf ( 1, '  Expected value is 0\n' );

  i = 0;
  x0 = 1;
  fprintf ( 1, '  %d  %d\n', i, x0 );
  for i = 1 : 10
    x0 = f5 ( x0 );
    fprintf ( 1, '  %d  %d\n', i, x0 );
  end

  return
end
