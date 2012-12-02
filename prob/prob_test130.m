function prob_test130 ( )

%*****************************************************************************80
%
%% TEST130 tests POWER_MEAN, POWER_SAMPLE, POWER_VARIANCE.
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
  fprintf ( 1, 'TEST130\n' );
  fprintf ( 1, '  For the Power PDF:\n' );
  fprintf ( 1, '  POWER_MEAN computes the mean;\n' );
  fprintf ( 1, '  POWER_SAMPLE samples;\n' );
  fprintf ( 1, '  POWER_VARIANCE computes the variance.\n' );

  a = 2.0;
  b = 3.0;

  check = power_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST130 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  mean = power_mean ( a, b );
  variance = power_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = power_sample ( a, b, seed );
  end

  mean = r8vec_mean ( nsample, x );
  variance = r8vec_variance ( nsample, x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
