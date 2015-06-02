function r8vec_permute_uniform_test ( )

%*****************************************************************************80
%
%% R8VEC_PERMUTE_UNIFORM_TEST tests R8VEC_PERMUTE_UNIFORM.
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
  fprintf ( 1, 'R8VEC_PERMUTE_UNIFORM_TEST\n' );
  fprintf ( 1, '  R8VEC_PERMUTE_UNIFORM randomly reorders an R8VEC.\n' );

  a = 100 + ( 1 : n );

  r8vec_print ( n, a, '  A, before rearrangement:' );

  [ a, seed ] = r8vec_permute_uniform ( n, a, seed );

  r8vec_print ( n, a, '  A, after rearrangement:' );

  return
end
