function subset_test087 ( )

%*****************************************************************************80
%
%% TEST087 tests PERM_CANON_TO_CYCLE.
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
  n = 6;
  p1 = [ 4, 5, 2, 1, 6, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST087\n' );
  fprintf ( 1, '  PERM_CANON_TO_CYCLE converts a permutation from\n' );
  fprintf ( 1, '  canonical to cycle form.\n' );
 
  perm_print ( n, p1, '  The permutation in canonical form:' );
 
  p2 = perm_canon_to_cycle ( n, p1 );

  perm_print ( n, p2, '  The permutation in cycle form:' );

  return
end
