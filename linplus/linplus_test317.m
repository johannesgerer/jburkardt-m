function linplus_test317 ( )

%*****************************************************************************80
%
%% TEST317 tests R8GE_INDICATOR.
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
  m = 7;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST317\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_INDICATOR sets up the indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  a = r8ge_indicator ( m, n );

  r8ge_print ( m, n, a, '  The R8GE indicator matrix:' );

  return
end
