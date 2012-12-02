function prob_test1306 ( )

%*****************************************************************************80
%
%% PROB_TEST1306 tests QUASIGEOMETRIC_MEAN, *_SAMPLE, *_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROB_TEST1306\n' );
  fprintf ( 1, '  For the Quasigeometric PDF:\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_MEAN computes the mean;\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_SAMPLE samples;\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_VARIANCE computes the variance.\n' );

  a = 0.4825;
  b = 0.5893;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  check = quasigeometric_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROB_TEST1306 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = quasigeometric_mean ( a, b );
  variance = quasigeometric_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = quasigeometric_sample ( a, b, seed );
  end

  mean = i4vec_mean ( sample_num, x );
  variance = i4vec_variance ( sample_num, x );
  xmax = max ( x(1:sample_num) );
  xmin = min ( x(1:sample_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', sample_num );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %6d\n', xmax );
  fprintf ( 1, '  Sample minimum =  %6d\n', xmin );

  return
end
