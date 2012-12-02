function i4lib_test71 ( )

%*****************************************************************************80
%
%% I4LIB_TEST71 tests I4VEC_PERMUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  b = 0;
  c = n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4LIB_TEST71\n' );
  fprintf ( 1, '  I4VEC_PERMUTE reorders an integer vector\n' );
  fprintf ( 1, '  according to a given permutation.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  A, before rearrangement:' );

  base = 1;
  p = perm_uniform ( n, base, seed );

  i4vec_print ( n, p, '  Permutation vector P:' );

  a = i4vec_permute ( n, a, p );

  i4vec_print ( n, a, '  A, after rearrangement:' );

  return
end
