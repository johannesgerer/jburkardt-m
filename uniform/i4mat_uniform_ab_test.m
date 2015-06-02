function i4mat_uniform_ab_test ( )

%*****************************************************************************80
%
%% I4MAT_UNIFORM_AB_TEST tests I4MAT_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  a = -100;
  b = 200;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4MAT_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  I4MAT_UNIFORM_AB computes pseudorandom values\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %f\n', a );
  fprintf ( 1, '  The upper endpoint B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  [ v, seed ] = i4mat_uniform_ab ( m, n, a, b, seed );

  i4mat_print ( m, n, v, '  The uniform I4MAT:' );

  return
end
