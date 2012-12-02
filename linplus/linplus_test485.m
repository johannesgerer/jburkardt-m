function linplus_test485 ( )

%*****************************************************************************80
%
%% TEST485 tests R8PBU_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 9;
  mu = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST485\n' );
  fprintf ( 1, '  R8PBU_INDICATOR sets up a R8PBU indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Bandwidth MU = %d\n', mu );

  a = r8pbu_indicator ( n, mu );

  r8pbu_print ( n, mu, a, '  The R8PBU indicator matrix:' );

  return
end
