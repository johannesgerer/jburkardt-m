function linplus_test428 ( )

%*****************************************************************************80
%
%% TEST428 tests R8LT_INDICATOR.
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
  m = 6;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST428\n' );
  fprintf ( 1, '  For a matrix in lower triangular storage,\n' );
  fprintf ( 1, '  R8LT_INDICATOR sets up an indicator matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  a = r8lt_indicator ( m, n );

  r8lt_print ( m, n, a, '  The R8LT indicator matrix:' );

  return
end
