function prob_test016 ( )

%*****************************************************************************80
%
%% TEST016 tests BETA_BINOMIAL_MEAN, BETA_BINOMIAL_SAMPLE, BETA_BINOMIAL_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST016\n' );
  fprintf ( 1, '  For the Beta Binomial PDF:\n' );
  fprintf ( 1, '  BETA_BINOMIAL_MEAN computes the mean;\n' );
  fprintf ( 1, '  BETA_BINOMIAL_SAMPLE samples;\n' );
  fprintf ( 1, '  BETA_BINOMIAL_VARIANCE computes the variance.\n' );

  a = 2.0;
  b = 3.0;
  c = 4;

  check = beta_binomial_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST016 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = beta_binomial_mean ( a, b, c );
  variance = beta_binomial_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %6d\n', c );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = beta_binomial_sample ( a, b, c, seed );
  end

  mean = i4vec_mean ( nsample, x );
  variance = i4vec_variance ( nsample, x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %6d\n', xmax );
  fprintf ( 1, '  Sample minimum =  %6d\n', xmin );

  return
end
