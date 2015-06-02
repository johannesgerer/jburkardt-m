function r8mat_house_post_test ( )

%*****************************************************************************80
%
%% R8MAT_HOUSE_POST_TEST tests R8MAT_HOUSE_POST.
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
  fprintf ( 1, 'R8MAT_HOUSE_POST_TEST\n' );
  fprintf ( 1, '  R8MAT_HOUSE_POST computes a Householder\n' );
  fprintf ( 1, '  postmultiplier;\n' );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( n, n, b, c, seed );
 
  r8mat_print ( n, n, a, '  Matrix A:' );

  row = 2;
  col = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I = %d, J = %d\n', row, col );
 
  h = r8mat_house_post ( n, a, row, col );
 
  r8mat_print ( n, n, h, '  Householder matrix H:' );
 
  ah = a * h;
 
  r8mat_print ( n, n, ah, '  Product A*H:' );
 
  return
end
