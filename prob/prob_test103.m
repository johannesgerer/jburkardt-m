function prob_test103 ( )

%*****************************************************************************80
%
%% TEST103 tests LOG_SERIES_MEAN, LOG_SERIES_SAMPLE, LOG_SERIES_VARIANCE.
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
  fprintf ( 1, 'TEST103\n' );
  fprintf ( 1, '  For the Logseries PDF:\n' );
  fprintf ( 1, '  LOG_SERIES_MEAN computes the mean;\n' );
  fprintf ( 1, '  LOG_SERIES_VARIANCE computes the variance;\n' );
  fprintf ( 1, '  LOG_SERIES_SAMPLE samples.\n' );

  a = 0.25;

  check = log_series_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST103 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = log_series_mean ( a );
  variance = log_series_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = log_series_sample ( a, seed );
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
