function subset_test041 ( )

%*****************************************************************************80
%
%% TEST041 test I4MAT_PERM.
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
  n = 9;

  p = [ 2,3,9,6,7,8,5,4,1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST041\n' );
  fprintf ( 1, '  I4MAT_PERM reorders an integer matrix in place.\n' );
  fprintf ( 1, '  The rows and columns use the same permutation.\n' );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = i * 10 + j;
    end
  end

  i4mat_print ( n, n, a, '  The input matrix:' );
 
  perm_print ( n, p, '  The row and column permutation:' );
 
  a = i4mat_perm ( n, a, p );
 
  i4mat_print ( n, n, a, '  The permuted matrix:' );
 
  return
end
