function linplus_test575 ( )

%*****************************************************************************80
%
%% TEST575 tests R8SR_RANDOM.
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
  fprintf ( 1, 'TEST575\n' );
  fprintf ( 1, '  R8SR_RANDOM randomizes a R8SR matrix\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ diag, off, seed ] = r8sr_random ( n, nz, row, col, seed );
%
%  Make a R8GE copy.
%
  b = r8sr_to_r8ge ( n, nz, row, col, diag, off );
%
%  Print the R8GE copy.
%
  r8ge_print ( n, n, b, '  The R8SR matrix, in R8GE form:' );

  return
end
