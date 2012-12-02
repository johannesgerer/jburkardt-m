function prob_test0276 ( )

%*****************************************************************************80
%
%% TEST0276 tests CARDIOID_MEAN, CARDIOID_SAMPLE, CARDIOID_VARIANCE.
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
  sample_num = 1000;

  a = 0.0;
  b = 0.25;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0276\n' );
  fprintf ( 1, '  For the Cardioid PDF:\n' );
  fprintf ( 1, '  CARDIOID_MEAN computes the mean;\n' );
  fprintf ( 1, '  CARDIOID_SAMPLE samples;\n' );
  fprintf ( 1, '  CARDIOID_VARIANCE computes the variance.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %f\n', a );
  fprintf ( 1, '  PDF parameter B = %f\n', b );

  if ( ~cardioid_check ( a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return;
  end

  mean = cardioid_mean ( a, b );
  variance = cardioid_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean =                    %f\n', mean );
  fprintf ( 1, '  PDF variance =                %f\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = cardioid_sample ( a, b, seed );
  end

  mean = r8vec_mean ( sample_num, x );
  variance = r8vec_variance ( sample_num, x );
  xmax = max ( x(1:sample_num) );
  xmin = min ( x(1:sample_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', sample_num );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
