function r8vec_uniform_ab_test ( )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_AB_TEST tests  R8VEC_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  a = -1.0;
  b = +5.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R8VEC_UNIFORM_AB computes a random R8VEC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %g <= x <= %g\n', a, b );
  fprintf ( 1, '  Initial seed is %d\n', seed );

  [ v, seed ] = r8vec_uniform_ab ( n, a, b, seed );

  r8vec_print ( n, v, '  Random R8VEC:' );

  return
end
