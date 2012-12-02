function prob_test116 ( )

%*****************************************************************************80
%
%% TEST116 tests NORMAL_01_MEAN, *_SAMPLE, *_VARIANCE.
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
  fprintf ( 1, 'TEST116\n' );
  fprintf ( 1, '  For the Normal 01 PDF:\n' );
  fprintf ( 1, '  NORMAL_01_MEAN computes the mean;\n' );
  fprintf ( 1, '  NORMAL_01_SAMPLE samples the PDF;\n' );
  fprintf ( 1, '  NORMAL_01_VARIANCE returns the variance.\n' );

  mean = normal_01_mean ( );
  variance = normal_01_variance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean =      %14f\n', mean );
  fprintf ( 1, '  PDF variance =  %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = normal_01_sample ( seed );
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
