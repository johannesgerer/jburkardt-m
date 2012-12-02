function subpak_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests PERM_INVERSE;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 7;

  p = [ 4, 3, 5, 1, 7, 6, 2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  PERM_INVERSE inverts a permutation in place;\n' );

  perm_print ( n, p, '  The original permutation:' );

  p = perm_inverse ( n, p );

  perm_print ( n, p, '  The inverted permutation:' );

  return
end
