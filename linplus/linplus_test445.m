function linplus_test445 ( )

%*****************************************************************************80
%
%% TEST445 tests R8PBL_INDICATOR.
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
  fprintf ( 1, 'TEST445\n' );
  fprintf ( 1, '  R8PBL_INDICATOR sets up a R8PBL indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Bandwidth MU = %d\n', mu );

  a = r8pbl_indicator ( n, mu );

  r8pbl_print ( n, mu, a, '  The R8PBL indicator matrix:' );

  return
end
