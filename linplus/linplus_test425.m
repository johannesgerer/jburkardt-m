function linplus_test425 ( )

%*****************************************************************************80
%
%% TEST425 tests R8CC_MXV, R8CC_VXM.
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
  m = 5;
  n = 5;
  nz_num = 12;
  colptr = [ 1, 4, 6, 8, 10, 13 ];
  rowind = [ 1, 2, 4, 1, 2, 3, 5, 4, 5, 1, 2, 5 ];
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST425\n' );
  fprintf ( 1, '  R8CC_MXV multiplies a R8CC matrix by a vector;\n' );
  fprintf ( 1, '  R8CC_VXM multiplies a vector by a R8CC matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );
%
%  Set the matrix.
%
  [ a, seed ] = r8cc_random ( m, n, nz_num, colptr, rowind, seed );
%
%  Make a R8GE copy.
%
  c = r8cc_to_r8ge ( m, n, nz_num, colptr, rowind, a );
%
%  Print the R8GE copy.
%
  r8ge_print ( n, n, c, '  The R8CC matrix, in R8GE form:' );

  x(1) = 1.0;
  x(2:n-1) = 0.0;
  x(n) = -1.0;

  r8vec_print ( n, x, '  The vector x:' );

  b = r8cc_mxv ( m, n, nz_num, colptr, rowind, a, x );

  r8vec_print ( n, b, '  The product A * x:' );

  b = r8cc_vxm ( m, n, nz_num, colptr, rowind, a, x );

  r8vec_print ( n, b, '  The product A'' * x:' );

  return
end
