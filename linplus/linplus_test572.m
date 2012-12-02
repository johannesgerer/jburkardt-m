function linplus_test572 ( )

%*****************************************************************************80
%
%% TEST572 tests R8SP_MXV, R8SP_VXM.
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
  nz_num = 10;
  col = [ 2, 5, 1, 5, 1, 2, 3, 4, 4, 1 ];
  row = [ 1, 1, 2, 2, 4, 4, 4, 5, 6, 7 ];
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST572\n' );
  fprintf ( 1, '  R8SP_MXV multiplies a R8SP matrix by a vector;\n' );
  fprintf ( 1, '  R8SP_VXM multiplies a vector by a R8SP matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
  fprintf ( 1, '  Matrix nonzeros =  %d\n', nz_num );
%
%  Set the matrix.
%
  [ a, seed ] = r8sp_random ( m, n, nz_num, row, col, seed );
%
%  Make a R8GE copy.
%
  c = r8sp_to_r8ge ( m, n, nz_num, row, col, a );
%
%  Print the R8GE copy.
%
  r8ge_print ( m, n, c, '  The R8SP matrix, in R8GE form:' );

  x(1) = 1.0E+00;
  x(2:n-1) = 0.0E+00;
  x(n) = -1.0E+00;

  r8vec_print ( n, x, '  The vector x:' );

  b = r8sp_mxv ( m, n, nz_num, row, col, a, x );

  r8vec_print ( m, b, '  The product A * x:' );

  x(1) = 1.0E+00;
  x(2:m-1) = 0.0E+00;
  x(m) = -1.0E+00;

  r8vec_print ( m, x, '  The vector x:' );

  b = r8sp_vxm ( m, n, nz_num, row, col, a, x );

  r8vec_print ( n, b, '  The product A'' * x:' );

  return
end
