function prob_test152 ( )

%*****************************************************************************80
%
%% TEST152 tests UNIFORM_DISCRETE_MEAN, UNIFORM_DISCRETE_SAMPLE, UNIFORM_DISCRETE_VARIANCE.
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
  fprintf ( 1, 'TEST152\n' );
  fprintf ( 1, '  For the Uniform discrete PDF:\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_MEAN computes the mean;\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_SAMPLE samples;\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_VARIANCE computes the variance.\n' );

  a = 1;
  b = 6;

  check = uniform_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST143 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = uniform_discrete_mean ( a, b );
  variance = uniform_discrete_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %6d\n', a );
  fprintf ( 1, '  PDF parameter B =             %6d\n', b );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = uniform_discrete_sample ( a, b, seed );
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
