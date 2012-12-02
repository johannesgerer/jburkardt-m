function prob_test055 ( )

%*****************************************************************************80
%
%% TEST055 tests EMPIRICAL_DISCRETE_MEAN, EMPIRICAL_DISCRETE_SAMPLE, EMPIRICAL_DISCRETE_VARIANCE.
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
  a = 6;
  nsample = 1000;

  b(1:a) = [ 1.0, 1.0, 3.0, 2.0, 1.0, 2.0 ];
  c(1:a) = [ 0.0, 1.0, 2.0, 4.5, 6.0, 10.0 ];

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST055\n' );
  fprintf ( 1, '  For the Empirical Discrete PDF:\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_MEAN computes the mean;\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_SAMPLE samples;\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_VARIANCE computes the variance.\n' );

  check = empirical_discrete_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST055 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = empirical_discrete_mean ( a, b, c );
  variance = empirical_discrete_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  r8vec_print ( a, b, '  PDF parameter B:' );
  r8vec_print ( a, c, '  PDF parameter C:' );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = empirical_discrete_sample ( a, b, c, seed );
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
