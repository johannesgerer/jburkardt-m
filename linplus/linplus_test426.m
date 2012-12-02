function linplus_test426 ( )

%*****************************************************************************80
%
%% TEST426 tests R8CC_PRINT.
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
  fprintf ( 1, 'TEST426\n' );
  fprintf ( 1, '  R8CC_PRINT prints a R8CC matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );
%
%  Set the matrix.
%
  [ a, seed ] = r8cc_random ( m, n, nz_num, colptr, rowind, seed );
%
%  Print the matrix.
%
  r8cc_print ( m, n, nz_num, colptr, rowind, a, '  The R8CC matrix:' );

  return
end
