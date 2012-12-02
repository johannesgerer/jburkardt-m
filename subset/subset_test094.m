function subset_test094 ( )

%*****************************************************************************80
%
%% TEST094 tests PERM_INVERSE;
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
  fprintf ( 1, 'TEST094\n' );
  fprintf ( 1, '  PERM_INVERSE inverts a permutation in place;\n' );
  fprintf ( 1, '\n' );

  perm_print ( n, p, '  The original permutation:' );
 
  p_inv = perm_inverse ( n, p );
 
  perm_print ( n, p_inv, '  The inverted permutation:' );
 
  return
end
