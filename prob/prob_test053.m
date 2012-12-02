function prob_test053 ( )

%*****************************************************************************80
%
%% TEST053 tests DISCRETE_MEAN, DISCRETE_SAMPLE, DISCRETE_VARIANCE.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST053\n' );
  fprintf ( 1, '  For the Discrete PDF:\n' );
  fprintf ( 1, '  DISCRETE_MEAN computes the mean;\n' );
  fprintf ( 1, '  DISCRETE_SAMPLE samples;\n' );
  fprintf ( 1, '  DISCRETE_VARIANCE computes the variance.\n' );

  b(1:6) = [ 1.0, 2.0, 6.0, 2.0, 4.0, 1.0 ];

  check = discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST053 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = discrete_mean ( a, b );
  variance = discrete_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameters B:\n' );
  for j = 1 : a
    fprintf ( 1, '  %6d  %14f\n', j, b(j) );
  end
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = discrete_sample ( a, b, seed );
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
