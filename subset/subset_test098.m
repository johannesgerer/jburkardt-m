function subset_test098 ( )

%*****************************************************************************80
%
%% TEST098 tests PERM_MUL.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST098\n' );
  fprintf ( 1, '  PERM_MUL multiplies two permutations.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ p1, seed ] = perm_random ( n, seed );
  [ p2, seed ] = perm_random ( n, seed );

  perm_print ( n, p1, '  Permutation P1:' );

  perm_print ( n, p2, '  Permutation P2:' );

  p3 = perm_mul ( n, p1, p2 );

  perm_print ( n, p3, '  Product permutation:' );

  return
end
