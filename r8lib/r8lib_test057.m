function subpak_test057 ( )

%*****************************************************************************80
%
%% TEST057 tests R8MAT_GIVENS_PRE.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST057\n' );
  fprintf ( 1, '  R8MAT_GIVENS_PRE computes a Givens premultiplier\n' );
  fprintf ( 1, '  rotation matrix.\n' );
 
  for i = 1 : n
    for j = 1 : n
      a(i,j) = i^( j - 1 );
    end
  end
 
  r8mat_print ( n, n, a, '  Matrix A:' );
 
  row = 3;
  col = 2;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I = %d, J = %d\n', row, col );
 
  g = r8mat_givens_pre ( n, a, row, col );

  r8mat_print ( n, n, g, '  G' );

  ga = g * a;
 
  r8mat_print ( n, n, ga, '  G*A' );

  return
end
