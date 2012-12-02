function subset_test106 ( )

%*****************************************************************************80
%
%% TEST106 tests PERM_TO_EQUIV.
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
  n = 9;
  p = [ 2,3,9,6,7,8,5,4,1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST106\n' );
  fprintf ( 1, '  PERM_TO_EQUIV returns the set partition\n' );
  fprintf ( 1, '  or equivalence classes determined by a\n' );
  fprintf ( 1, '  permutation.\n' );

  perm_print ( n, p, '  The input permutation:' );
 
  [ npart, jarray, a ] = perm_to_equiv ( n, p );

  equiv_print ( n, a, '  The partition:' );

  return
end
