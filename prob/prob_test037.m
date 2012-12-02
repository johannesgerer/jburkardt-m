function prob_test037 ( )

%*****************************************************************************80
%
%% TEST037 tests CIRCULAR_NORMAL_01_MEAN, *_SAMPLE, *_VARIANCE.
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
  fprintf ( 1, 'TEST037\n' );
  fprintf ( 1, '  For the Circular Normal 01 PDF:\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_01_MEAN computes the mean;\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_01_SAMPLE samples;\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_01_VARIANCE computes variance.\n' );

  mean = circular_normal_01_mean ( );
  variance = circular_normal_01_variance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF means =               %14f  %14f\n', mean(1:2) );
  fprintf ( 1, '  PDF variances =           %14f  %14f\n', variance(1:2) );
  
  for i = 1 : nsample
    [ x, seed ] = circular_normal_01_sample ( seed );
    x_table(i,1) = x(1);
    x_table(i,2) = x(2);
  end

  for j = 1 : 2
    mean(j) = r8vec_mean ( nsample, x_table(1:nsample,j) );
    variance(j) = r8vec_variance ( nsample, x_table(1:nsample,j) );
    xmax(j) = max ( x_table(1:nsample,j) );
    xmin(j) = min ( x_table(1:nsample,j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f  %14f\n', mean(1:2) );
  fprintf ( 1, '  Sample variance = %14f  %14f\n', variance(1:2) );
  fprintf ( 1, '  Sample maximum =  %14f  %14f\n', xmax(1:2) );
  fprintf ( 1, '  Sample minimum =  %14f  %14f\n', xmin(1:2) );

  return
end
