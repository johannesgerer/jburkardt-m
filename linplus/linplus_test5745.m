function linplus_test5745 ( )

%*****************************************************************************80
%
%% TEST5745 tests R8SR_PRINT.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST5745\n' );
  fprintf ( 1, '  R8SR_PRINT prints a R8SR matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ diag, off, seed ] = r8sr_random ( n, nz, row, col, seed );
%
%  Print the matrix.
%
  r8sr_print ( n, nz, row, col, diag, off, '  The R8SR matrix:' );

  return
end
