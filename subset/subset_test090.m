function subset_test090 ( )

%*****************************************************************************80
%
%% TEST090 tests PERM_CYCLE_TO_INDEX, PERM_INDEX_TO_CYCLE.
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
  p1 = [ 2,3,9,6,7,8,5,4,1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST090\n' );
  fprintf ( 1, '  PERM_CYCLE_TO_INDEX converts a permutation from\n' );
  fprintf ( 1, '    cycle to standard index form.\n' );
  fprintf ( 1, '  PERM_INDEX_TO_CYCLE converts a permutation from\n' );
  fprintf ( 1, '    standard index to cycle form.\n' );
 
  perm_print ( n, p1, '  The standard index form permutation:' );
 
  p2 = perm_index_to_cycle ( n, p1 );

  perm_print ( n, p2, '  The permutation in cycle form:' );

  p3 = perm_cycle_to_index ( n, p2 );
 
  perm_print ( n, p3, '  The standard index form permutation:' );
 
  return
end
