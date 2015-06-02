function r8vec_uniform_01_test ( )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_01_TEST tests R8VEC_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_UNIFORM_01\n' );
  fprintf ( 1, '  R8VEC_UNIFORM_01 returns a random R8VEC\n' );
  fprintf ( 1, '  with entries in [ 0.0, 1.0 ]\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED = %d\n', seed );
 
  [ r, seed ] = r8vec_uniform_01 ( n, seed );

  r8vec_print ( n, r, '  Random R8VEC:' );

  return
end
