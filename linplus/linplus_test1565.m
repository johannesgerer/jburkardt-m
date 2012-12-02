function linplus_test1565 ( )

%*****************************************************************************80
%
%% TEST1565 tests R8BUT_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 6
  mu = 2

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1565\n' );
  fprintf ( 1, '  R8BUT_INDICATOR sets up a R8BUT indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  a = r8but_indicator ( n, mu );

  r8but_print ( n, mu, a, '  The indicator matrix:' );

  return
end
