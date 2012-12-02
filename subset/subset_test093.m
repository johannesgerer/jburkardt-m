function subset_test093 ( )

%*****************************************************************************80
%
%% TEST093 tests PERM_ASCEND.
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
  fprintf ( 1, 'TEST093\n' );
  fprintf ( 1, '  PERM_ASCEND determines the length of the longest\n' );
  fprintf ( 1, '  increasing subsequence in a permutation.\n' );

  perm_print ( n, p, '  The permutation:' );

  [ length, subseq ] = perm_ascend ( n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The length of the longest increasing subsequence is %d\n', length );

  i4vec_print ( length, subseq, '  A longest increasing subsequence:' );

  return
end
