function r8vec_normal_ab_test ( )

%*****************************************************************************80
%
%% R8VEC_NORMAL_AB_TEST tests R8VEC_NORMAL_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NORMAL_AB_TEST\n' );
  fprintf ( 1, '  R8VEC_NORMAL_AB computes a scaled pseudonormal vector.\n' );

  n = 10;
  mu = 15.0;
  sigma = 0.25;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MU = %g\n', mu );
  fprintf ( 1, '  SIGMA = %g\n', sigma );
  fprintf ( 1, '  SEED = %g\n', seed );

  [ r, seed ] = r8vec_normal_ab ( n, mu, sigma, seed );

  r8vec_print ( n, r, '  The vector:' );

  return
end
