function r8mat_maxcol_minrow_test ( )

%*****************************************************************************80
%
%% R8MAT_MAXCOL_MINROW_TEST tests R8MAT_MAXCOL_MINROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2015
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
  fprintf ( 1, 'R8MAT_MAXCOL_MINROW_TEST\n' );
  fprintf ( 1, '  R8MAT_MAXCOL_MINROW computes the maximum over\n' );
  fprintf ( 1, '  columns of the mininum over rows;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
 
  r8mat_print ( m, n, a, '  Random array:' );
 
  temp = r8mat_maxcol_minrow ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MAXCOL_MINROW = %f\n', temp );

  return
end
