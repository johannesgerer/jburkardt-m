function truncated_normal_ab_variance_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_VARIANCE_TEST tests TRUNCATED_NORMAL_AB_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2015
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;
  seed = 123456789;
  a = 50.0;
  b = 150.0;
  mu = 100.0;
  sigma = 25.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_AB_VARIANCE_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_AB_VARIANCE computes the variance.\n' );
  fprintf ( 1, '  of the Truncated Normal Distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', sigma );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [%g,%g]\n', a, b );

  variance = truncated_normal_ab_variance ( mu, sigma, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF variance = %g\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = truncated_normal_ab_sample ( mu, sigma, a, b, seed );
  end

  variance = var ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %d\n', sample_num );
  fprintf ( 1, '  Sample variance = %g\n', variance );

  return
end
