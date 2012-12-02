function subset_test095 ( )

%*****************************************************************************80
%
%% TEST095 tests PERM_INVERSE2.
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
  n = 7;
  p = [ 4, 3, 5, 1, 7, 6, 2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST095\n' );
  fprintf ( 1, '  PERM_INVERSE2 inverts a permutation in place.\n' );

  perm_print ( n, p, '  The original permutation:' );
 
  p_inv = perm_inverse2 ( n, p );
 
  perm_print ( n, p_inv, '  The inverted permutation:' );
 
  return
end
