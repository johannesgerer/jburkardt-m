function subset_test086 ( )

%*****************************************************************************80
%
%% TEST086 tests PERM_BREAK_COUNT.
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
  p = [ 4, 5, 2, 1, 6, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST086\n' );
  fprintf ( 1, '  PERM_BREAK_COUNT counts the breaks in a permutation.\n' );
 
  perm_print ( n, p, '  The permutation:' );
 
  break_count = perm_break_count ( n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of breaks is %d\n', break_count );

  return
end
