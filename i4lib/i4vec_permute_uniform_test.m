function i4vec_permute_uniform_test ( )

%*****************************************************************************80
%
%% I4VEC_PERMUTE_UNIFORM_TEST tests I4VEC_PERMUTE_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2015
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_PERMUTE_UNIFORM_TEST\n' );
  fprintf ( 1, '  I4VEC_PERMUTE_UNIFORM randomly reorders an I4VEC.\n' );

  a = 100 + ( 1 : n );

  i4vec_print ( n, a, '  A, before rearrangement:' );

  [ a, seed ] = i4vec_permute_uniform ( n, a, seed );

  i4vec_print ( n, a, '  A, after rearrangement:' );

  return
end
