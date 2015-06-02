function r8mat_normal_ab_test ( )

%*****************************************************************************80
%
%% R8MAT_NORMAL_AB_TEST tests R8MAT_NORMAL_AB.
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
  fprintf ( 1, 'R8MAT_NORMAL_AB_TEST\n' );
  fprintf ( 1, '  R8MAT_NORMAL_AB computes a scaled pseudonormal matrix.\n' );

  m = 5;
  n = 4;
  mu = 100.0;
  sigma = 5.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MU = %g\n', mu );
  fprintf ( 1, '  SIGMA = %g\n', sigma );
  fprintf ( 1, '  SEED = %d\n', seed );

  [ r, seed ] = r8mat_normal_ab ( m, n, mu, sigma, seed );

  r8mat_print ( m, n, r, '  The matrix:' );

  return
end
