function linplus_test115 ( )

%*****************************************************************************80
%
%% TEST115 tests R85_INDICATOR.
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
  fprintf ( 1, 'TEST115\n' );
  fprintf ( 1, '  R85_INDICATOR sets up a R85 indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r85_indicator ( n );

  r85_print ( n, a, '  The R85 indicator matrix:' );

  return
end
