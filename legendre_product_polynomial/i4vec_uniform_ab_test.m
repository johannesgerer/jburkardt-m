function i4vec_uniform_ab_test ( )

%*****************************************************************************80
%
%% I4VEC_UNIFORM_AB_TEST tests I4VEC_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  n = 20;
  a = -100;
  b = 200;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  I4VEC_UNIFORM_AB computes pseudorandom values\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %f\n', a );
  fprintf ( 1, '  The upper endpoint B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  [ v, seed ] = i4vec_uniform_ab ( n, a, b, seed );

  i4vec_print ( n, v, '  The random vector:' );

  return
end
