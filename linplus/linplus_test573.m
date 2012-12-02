function linplus_test573 ( )

%*****************************************************************************80
%
%% TEST573 tests R8SR_INDICATOR.
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
  nz = 7;
  col = [ 2, 5, 5, 1, 1, 2, 3 ];
  row = [ 1, 3, 4, 5, 6, 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST573\n' );
  fprintf ( 1, '  R8SR_INDICATOR sets up a R8SR indicator matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  [ diag, off ] = r8sr_indicator ( n, nz, row, col );

  r8sr_print ( n, nz, row, col, diag, off, '  The R8SR indicator matrix:' );

  return
end
