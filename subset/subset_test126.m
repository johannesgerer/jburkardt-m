function test126 ( )

%*****************************************************************************80
%
%% TEST126 tests R8MAT_PERM.
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
  n = 9;
  p = [ 2,3,9,6,7,8,5,4,1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST126\n' );
  fprintf ( 1, '  R8MAT_PERM reorders a real matrix in place.\n' );
  fprintf ( 1, '  The rows and columns use the same permutation.\n' );
 
  for i = 1 : n
    for j = 1 : n
      a(i,j) = i * 10 + j;
    end
  end
 
  r8mat_print ( n, n, a, '  The original matrix' );
 
  perm_print ( n, p, '  The row and column permutation:' );
 
  a = r8mat_perm ( n, a, p );
 
  r8mat_print ( n, n, a, '  The permuted matrix' );

  return
end
