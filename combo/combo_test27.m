function combo_test27 ( )

%*****************************************************************************80
%
%% COMBO_TEST27 tests PERM_INV and PERM_MUL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST27\n' );
  fprintf ( 1, '  Permutations of the integers:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  PERM_INV computes an inverse permutation,\n' );
  fprintf ( 1, '  PERM_MUL multiplies two permutations.\n' );
%
%  Enumerate.
%
  nperm = perm_enum ( n );
%
%  Unrank.
%
  rank = floor ( nperm / 2 );

  p = perm_lex_unrank ( rank, n );

  perm_print ( n, p, '  The permutation P is ' );
%
%  Invert.
%
  q = perm_inv ( n, p );

  perm_print ( n, q, '  The inverse permutation Q is ' );
%
%  Multiply.
%
  r = perm_mul ( n, p, q );

  perm_print ( n, r, '  The product R = P * Q is ' );

  return
end
