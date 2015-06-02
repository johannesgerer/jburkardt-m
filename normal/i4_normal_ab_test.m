function i4_normal_ab_test ( )

%*****************************************************************************80
%
%% I4_NORMAL_AB_TEST tests I4_NORMAL_AB.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_NORMAL_AB_TEST\n' );
  fprintf ( 1, '  I4_NORMAL_AB computes pseudonormal integer values \n' );
  fprintf ( 1, '  with mean MU and standard deviation SIGMA.\n' );

  mu = 70.0;
  sigma = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mean = %g\n', mu );
  fprintf ( 1, '  The standard deviation = %g\n', sigma );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = i4_normal_ab ( mu, sigma, seed );
    fprintf ( 1, '  %8d  %8d\n', i, r );
  end

  return
end
