function subset_test108 ( )

%*****************************************************************************80
%
%% TEST108 tests PERM_UNRANK.
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
  n = 4;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST108\n' );
  fprintf ( 1, '  PERM_UNRANK, given a rank, computes the\n' );
  fprintf ( 1, '  corresponding permutation.\n' );
  fprintf ( 1, '\n' );
  rank = 6;
  fprintf ( 1, '  The requested rank is %d\n', rank );
 
  p = perm_unrank ( n, rank );
 
  perm_print ( n, p, '  The permutation:' );
 
  return
end
