function subset_test105 ( )

%*****************************************************************************80
%
%% TEST105 tests PERM_RANK.
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
  p = [ 1, 4, 2, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST105\n' );
  fprintf ( 1, '  PERM_RANK ranks a permutation.\n' );

  perm_print ( n, p, '  The permutation:' );
 
  rank = perm_rank ( n, p );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank is: %d\n', rank );

  return
end
