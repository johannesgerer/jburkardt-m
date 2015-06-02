function r8lib_test062 ( )

%*****************************************************************************80
%
%% R8LIB_TEST062 tests R8MAT_HOUSE_PRE.
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
  n = 5;

  b = 0.0;
  c = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST062\n' );
  fprintf ( 1, '  R8MAT_HOUSE_PRE computes a Householder premultiplier;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( n, n, b, c, seed );
 
  r8mat_print ( n, n, a, '  Matrix A:' );

  row = 2;
  col = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I = %d, J = %d\n', row, col );
 
  h = r8mat_house_pre ( n, a, row, col );
 
  r8mat_print ( n, n, h, '  Householder matrix H:' );
 
  ha = h * a;
 
  r8mat_print ( n, n, ha, '  Product H*A:' );
 
  return
end
