function prob_test043 ( )

%*****************************************************************************80
%
%% TEST043 tests DERANGED_MEAN, DERANGED_VARIANCE, DERANGED_SAMPLE.
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
  fprintf ( 1, 'TEST043\n' );
  fprintf ( 1, '  For the Deranged PDF:\n' );
  fprintf ( 1, '  DERANGED_MEAN computes the mean.\n' );
  fprintf ( 1, '  DERANGED_VARIANCE computes the variance.\n' );
  fprintf ( 1, '  DERANGED_SAMPLE samples.\n' );

  a = 7;

  check = deranged_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST043 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = deranged_mean ( a );
  variance = deranged_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = deranged_sample ( a, seed );
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
