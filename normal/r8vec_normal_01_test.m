function r8vec_normal_01_test ( )

%*****************************************************************************80
%
%% R8VEC_NORMAL_01_TEST tests R8VEC_NORMAL_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NORMAL_01_TEST\n' );
  fprintf ( 1, '  R8VEC_NORMAL_01 computes a vector of unit pseudonormal values.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED = %d\n', seed );

  [ r, seed ] = r8vec_normal_01 ( n, seed );

  r8vec_print ( n, r, '  The vector:' );

  return
end
