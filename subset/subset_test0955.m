function subset_test0955 ( )

%*****************************************************************************80
%
%% TEST0955 tests PERM_INVERSE3.
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
  fprintf ( 1, 'TEST0955\n' );
  fprintf ( 1, '  PERM_INVERSE3 inverts a permutation.\n' );

  perm_print ( n, p, '  The original permutation:' );
 
  p_inv = perm_inverse3 ( n, p );
 
  perm_print ( n, p_inv, '  The inverted permutation:' );
 
  return
end
