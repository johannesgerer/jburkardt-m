function prob_test120 ( )

%*****************************************************************************80
%
%% TEST120 tests PARETO_MEAN, PARETO_SAMPLE, PARETO_VARIANCE.
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
  fprintf ( 1, 'TEST120\n' );
  fprintf ( 1, '  For the Pareto PDF:\n' );
  fprintf ( 1, '  PARETO_MEAN computes the mean;\n' );
  fprintf ( 1, '  PARETO_SAMPLE samples;\n' );
  fprintf ( 1, '  PARETO_VARIANCE computes the variance.\n' );

  a = 2.0;
  b = 3.0;

  check = pareto_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST120 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = pareto_mean ( a, b );
  variance = pareto_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = pareto_sample ( a, b, seed );
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
