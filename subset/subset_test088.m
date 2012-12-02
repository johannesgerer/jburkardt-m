function subset_test088 ( )

%*****************************************************************************80
%
%% TEST088 tests PERM_CYCLE.
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
  fprintf ( 1, 'TEST088\n' );
  fprintf ( 1, '  PERM_CYCLE analyzes a permutation.\n' );
 
  perm_print ( n, p, '  The permutation:' );
 
  iopt = 1;
  [ p2, isgn, ncycle ] = perm_cycle ( n, iopt, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NCYCLE = %d\n', ncycle );
  fprintf ( 1, '  ISGN =   %d\n', isgn );

  perm_print ( n, p2, '  The permutation in cycle form:' );
 
  return
end
