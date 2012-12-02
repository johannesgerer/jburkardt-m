function subpak_test056 ( )

%*****************************************************************************80
%
%% TEST056 tests R8MAT_GIVENS_POST.
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
  fprintf ( 1, 'TEST056\n' );
  fprintf ( 1, '  R8MAT_GIVENS_POST computes a Givens postmultiplier\n' );
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

  g = r8mat_givens_post ( n, a, row, col );
 
  r8mat_print ( n, n, g, '  G' );

  ag = a * g;
 
  r8mat_print ( n, n, ag, '  A * G' );

  return
end
