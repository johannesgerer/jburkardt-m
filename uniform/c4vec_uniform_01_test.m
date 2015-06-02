function c4vec_uniform_01_test ( )

%*****************************************************************************80
%
% C4VEC_UNIFORM_01_TEST tests C4VEC_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 December 2014
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C4VEC_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C4VEC_UNIFORM_01 computes pseudorandom complex values\n' );
  fprintf ( 1, '  in the unit circle.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  n = 10;

  [ c, seed ] = c4vec_uniform_01 ( n, seed );

  c4vec_print ( n, c, '  The Uniform C4VEC:' );

  return
end
