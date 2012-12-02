function linplus_test574 ( )

%*****************************************************************************80
%
%% TEST574 tests R8SR_MXV, R8SR_VXM.
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
  fprintf ( 1, 'TEST574\n' );
  fprintf ( 1, '  R8SR_MXV multiplies a R8SR matrix by a vector;\n' );
  fprintf ( 1, '  R8SR_VXM multiplies a vector by a R8SR matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ diag, off, seed ] = r8sr_random ( n, nz, row, col, seed );
%
%  Make a R8GE copy.
%
  c = r8sr_to_r8ge ( n, nz, row, col, diag, off );
%
%  Print the R8GE copy.
%
  r8ge_print ( n, n, c, '  The R8SR matrix, in R8GE form:' );

  x(1) = 1.0E+00;
  x(2:n-1) = 0.0E+00;
  x(n) = -1.0E+00;

  r8vec_print ( n, x, '  The vector x:' );

  b = r8sr_mxv ( n, nz, row, col, diag, off, x );

  r8vec_print ( n, b, '  The product A * x:' );

  b = r8sr_vxm ( n, nz, row, col, diag, off, x );

  r8vec_print ( n, b, '  The product A'' * x:' );

  return
end
