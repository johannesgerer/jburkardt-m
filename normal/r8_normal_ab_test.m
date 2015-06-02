function r8_normal_ab_test ( )

%*****************************************************************************80
%
%% R8_NORMAL_AB_TEST tests R8_NORMAL_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_NORMAL_AB_TEST\n' );
  fprintf ( 1, '  R8_NORMAL_AB computes pseudonormal values \n' );
  fprintf ( 1, '  with mean MU and standard deviation SIGMA.\n' );

  mu = 10.0;
  sigma = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mean = %f\n', mu );
  fprintf ( 1, '  The standard deviation = %f\n', sigma );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r8_normal_ab ( mu, sigma, seed );
    fprintf ( 1, '  %6d  %14f\n', i, r );
  end

  return
end
