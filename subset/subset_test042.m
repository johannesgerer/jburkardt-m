function subset_test042 ( )

%*****************************************************************************80
%
%% TEST042 test I4MAT_PERM2.
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
  m = 9;
  n = 7;

  p = [ 2,3,9,6,7,8,5,4,1 ];
  q = [ 3,4,5,6,7,1,2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST042\n' );
  fprintf ( 1, '  I4MAT_PERM2 reorders an integer matrix in place.\n' );
  fprintf ( 1, '  Rows and columns use different permutations.\n' );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = i * 10 + j;
    end
  end
 
  i4mat_print ( m, n, a, '  The input matrix:' );
 
  perm_print ( m, p, '  The row permutation:' );

  perm_print ( n, q, '  The column permutation:' );
 
  a = i4mat_perm2 ( m, n, a, p, q );
 
  i4mat_print ( m, n, a, '  The permuted matrix:' );

  return
end
