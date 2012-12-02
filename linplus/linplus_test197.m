function linplus_test197 ( )

%*****************************************************************************80
%
%% TEST197 tests R8CI_INDICATOR.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST197\n' );
  fprintf ( 1, '  R8CI_INDICATOR sets up a R8CI indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  a = r8ci_indicator ( n );

  r8ci_print ( n, a, '  The circulant matrix:' );

  return
end
