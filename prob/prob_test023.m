function prob_test023 ( )

%*****************************************************************************80
%
%% TEST023 tests BINOMIAL_MEAN, BINOMIAL_SAMPLE, BINOMIAL_VARIANCE.
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
  fprintf ( 1, 'TEST023\n' );
  fprintf ( 1, '  For the Binomial PDF:\n' );
  fprintf ( 1, '  BINOMIAL_MEAN computes the mean;\n' );
  fprintf ( 1, '  BINOMIAL_SAMPLE samples;\n' );
  fprintf ( 1, '  BINOMIAL_VARIANCE computes the variance.\n' );

  a = 5;
  b = 0.30;

  check = binomial_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST023 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = binomial_mean ( a, b );
  variance = binomial_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = binomial_sample ( a, b, seed );
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
