function prob_test027 ( )

%*****************************************************************************80
%
%% TEST027 tests BURR_MEAN, BURR_VARIANCE, BURR_SAMPLE;
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
  fprintf ( 1, 'TEST027\n' );
  fprintf ( 1, '  For the Burr PDF:\n' );
  fprintf ( 1, '  BURR_MEAN computes the mean;\n' );
  fprintf ( 1, '  BURR_VARIANCE computes the variance;\n' );
  fprintf ( 1, '  BURR_SAMPLE samples;\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;
  d = 2.0;

  check = burr_check ( a, b, c, d );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST027 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = burr_mean ( a, b, c, d );
  variance = burr_variance ( a, b, c, d );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %14f\n', c );
  fprintf ( 1, '  PDF parameter D = %14f\n', d );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = burr_sample ( a, b, c, d, seed );
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
