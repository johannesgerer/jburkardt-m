function subset_test089 ( )

%*****************************************************************************80
%
%% TEST089 tests PERM_CYCLE_TO_CANON.
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
  p1 = [ -6, 3, 1, -5, 4, -2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST089\n' );
  fprintf ( 1, '  PERM_CYCLE_TO_CANON converts a permutation from\n' );
  fprintf ( 1, '  cycle to canonical form.\n' );
 
  perm_print ( n, p1, '  The permutation in cycle form:' );
 
  p2 = perm_cycle_to_canon ( n, p1 );

  perm_print ( n, p2, '  The permutation in canonical form:' );

  return
end
