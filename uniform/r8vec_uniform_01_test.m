function r8vec_uniform_01_test ( )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_01_TEST tests  R8VEC_UNIFORM_01.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  R8VEC_UNIFORM_01 computes a random R8VEC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed is %d\n', seed );

  [ v, seed ] = r8vec_uniform_01 ( n, seed );

  r8vec_print ( n, v, '  Random R8VEC:' );

  return
end
