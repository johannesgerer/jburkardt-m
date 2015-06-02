function r4mat_uniform_ab_test ( )

%*****************************************************************************80
%
%% R4MAT_UNIFORM_AB_TEST tests R4MAT_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 Deember 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  a = -1.0;
  b = +5.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R4MAT_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R4MAT_UNIFORM_AB computes a random R4MAT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %g <= x <= %g\n', a, b );
  fprintf ( 1, '  Initial seed is %d\n', seed );

  [ v, seed ] = r4mat_uniform_ab ( m, n, a, b, seed );

  r4mat_print ( m, n, v, '  Uniform R4MAT:' );

  return
end
