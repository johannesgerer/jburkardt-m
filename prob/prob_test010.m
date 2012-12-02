function prob_test010 ( )

%*****************************************************************************80
%
%% TEST010 tests BERNOULLI_MEAN, BERNOULLI_SAMPLE, BERNOULLI_VARIANCE.
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
  fprintf ( 1, 'TEST010\n' );
  fprintf ( 1, '  For the Bernoulli PDF:\n' );
  fprintf ( 1, '  BERNOULLI_MEAN computes the mean;\n' );
  fprintf ( 1, '  BERNOULLI_SAMPLE samples;\n' );
  fprintf ( 1, '  BERNOULLI_VARIANCE computes the variance.\n' );

  a = 0.75;

  check = bernoulli_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST010 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = bernoulli_mean ( a );
  variance = bernoulli_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = bernoulli_sample ( a, seed );
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
