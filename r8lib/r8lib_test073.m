function r8lib_test073 ( )

%*****************************************************************************80
%
%% TEST073 tests R8MAT_MAXCOL_MINROW, *_MAXROW_MINCOL, *_MINCOL_MAXROW, *_MINROW_MAXCOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 3;

  b = 0.0;
  c = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST073\n' );
  fprintf ( 1, '  R8MAT_MAXCOL_MINROW computes the maximum over\n' );
  fprintf ( 1, '  columns of the mininum over rows;\n' );
  fprintf ( 1, '  R8MAT_MAXROW_MINCOL computes the maximum over\n' );
  fprintf ( 1, '  rows of the mininum over columns;\n' );
  fprintf ( 1, '  R8MAT_MINCOL_MAXROW computes the minimum over\n' );
  fprintf ( 1, '  columns of the maxinum over rows;\n' );
  fprintf ( 1, '  R8MAT_MINROW_MAXCOL computes the minimum over\n' );
  fprintf ( 1, '  rows of the maxinum over columns;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
 
  r8mat_print ( m, n, a, '  Random array:' );
 
  temp1 = r8mat_maxcol_minrow ( m, n, a );
  temp2 = r8mat_minrow_maxcol ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MAXCOL_MINROW = %f\n', temp1 );
  fprintf ( 1, '  MINROW_MAXCOL = %f\n', temp2 );

  temp1 = r8mat_maxrow_mincol ( m, n, a );
  temp2 = r8mat_mincol_maxrow ( m, n, a );

  fprintf ( 1, '  MAXROW_MINCOL = %f\n', temp1 );
  fprintf ( 1, '  MINCOL_MAXROW = %f\n', temp2 );

  return
end
