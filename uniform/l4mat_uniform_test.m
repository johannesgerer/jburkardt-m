function l4mat_uniform_test ( )

%*****************************************************************************80
%
%% L4MAT_UNIFORM_TEST tests L4MAT_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'L4MAT_UNIFORM_TEST\n' );
  fprintf ( 1, '  L4MAT_UNIFORM computes a vector of\n' );
  fprintf ( 1, '  pseudorandom logical values.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );

  [ l, seed ] = l4mat_uniform ( m, n, seed );

  l4mat_print ( m, n, l, '  Uniform L4MAT:' );

  return
end
