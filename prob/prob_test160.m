function prob_test160 ( )

%*****************************************************************************80
%
%% TEST160 tests WEIBULL_DISCRETE_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST160\n' );
  fprintf ( 1, '  For the discrete Weibull PDF:\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_SAMPLE samples.\n' );

  a = 0.5;
  b = 1.5;

  check = weibull_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST160 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =     %14f\n', a );
  fprintf ( 1, '  PDF parameter B =     %14f\n', b );
  
  for i = 1 : nsample
    [ x(i), seed ] = weibull_discrete_sample ( a, b, seed );
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
