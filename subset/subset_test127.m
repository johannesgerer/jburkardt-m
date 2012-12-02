function test127 ( )

%*****************************************************************************80
%
%% TEST127 tests R8MAT_PERM2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 9;
  n = 7;
  p = [ 2, 3, 9, 6, 7, 8, 5, 4, 1 ];
  q = [ 3, 4, 5, 6, 7, 1, 2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST127\n' );
  fprintf ( 1, '  R8MAT_PERM2 reorders a real matrix in place.\n' );
  fprintf ( 1, '  Rows and columns use different permutations.\n' );
 
  for i = 1 : m
    for j = 1 : n
      a(i,j) = i * 10 + j;
    end
  end
 
  r8mat_print ( m, n, a, '  The original matrix' );
 
  perm_print ( m, p, '  The row permutation:' );
 
  perm_print ( n, q, '  The column permutation:' );

  a = r8mat_perm2 ( m, n, a, p, q );
 
  r8mat_print ( m, n, a, '  The permuted matrix' );
 
  return
end
