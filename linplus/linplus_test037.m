function linplus_test037 ( )

%*****************************************************************************80
%
%% TEST037 tests R83_INDICATOR.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST037\n' );
  fprintf ( 1, '  R83_INDICATOR sets up a R83 indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r83_indicator ( n );

  r83_print ( n, a, '  The R83 indicator matrix:' );

  return
end
