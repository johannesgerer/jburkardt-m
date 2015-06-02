function c8vec_uniform_01_test ( )

%*****************************************************************************80
%
%% C8VEC_UNIFORM_01_TEST tests C8VEC_UNIFORM_01;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2015
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8VEC_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C8VEC_UNIFORM_01_TEST returns a random C8VEC\n' );

  seed = 123456789;

  [ a, seed ] = c8vec_uniform_01 ( n, seed );
 
  c8vec_print ( n, a, '  The random C8VEC:' );

  return
end
