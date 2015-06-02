function l4vec_uniform_test ( )

%*****************************************************************************80
%
%% L4VEC_UNIFORM_TEST tests L4VEC_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'L4VEC_UNIFORM_TEST\n' );
  fprintf ( 1, '  L4VEC_UNIFORM computes a vector of\n' );
  fprintf ( 1, '  pseudorandom logical values.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );

  [ l, seed ] = l4vec_uniform ( n, seed );

  l4vec_print ( n, l, '  Uniform L4VEC:' );

  return
end
