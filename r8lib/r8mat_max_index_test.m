function r8mat_max_index_test ( )

%*****************************************************************************80
%
%% R8MAT_MAX_INDEX_TEST tests R8MAT_MAX_INDEX.
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
  fprintf ( 1, 'R8MAT_MAX_INDEX_TEST\n' );
  fprintf ( 1, '  For an R8MAT,\n' );
  fprintf ( 1, '  R8MAT_MAX_INDEX locates the maximum entry;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
 
  r8mat_print ( m, n, a, '  Random array:' );
 
  [ i, j ] = r8mat_max_index ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum I,J indices = (%d,%d)\n', i, j );

  return
end
