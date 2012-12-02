function prob_test0375 ( )

%*****************************************************************************80
%
%% TEST0375 tests CIRCULAR_NORMAL_*.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;
  seed = 123456789;

  a = [ 1.0, 5.0 ];
  b = 0.75;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0375\n' );
  fprintf ( 1, '  For the Circular Normal 01 PDF:\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_MEAN computes the mean;\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_SAMPLE samples;\n' );
  fprintf ( 1, '  CIRCULAR_NORMAL_VARIANCE computes variance.\n' );

  mean = circular_normal_mean ( a, b );
  variance = circular_normal_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF means =               %14f  %14f\n', mean(1:2) );
  fprintf ( 1, '  PDF variances =           %14f  %14f\n', variance(1:2) );
  
  for i = 1 : sample_num
    [ x, seed ] = circular_normal_sample ( a, b, seed );
    x_table(i,1) = x(1);
    x_table(i,2) = x(2);
  end

  for j = 1 : 2
    mean(j) = r8vec_mean ( sample_num, x_table(1:sample_num,j) );
    variance(j) = r8vec_variance ( sample_num, x_table(1:sample_num,j) );
    xmax(j) = max ( x_table(1:sample_num,j) );
    xmin(j) = min ( x_table(1:sample_num,j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', sample_num );
  fprintf ( 1, '  Sample mean =     %14f  %14f\n', mean(1:2) );
  fprintf ( 1, '  Sample variance = %14f  %14f\n', variance(1:2) );
  fprintf ( 1, '  Sample maximum =  %14f  %14f\n', xmax(1:2) );
  fprintf ( 1, '  Sample minimum =  %14f  %14f\n', xmin(1:2) );

  return
end
