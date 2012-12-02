function prob_test111 ( )

%*****************************************************************************80
%
%% TEST111 tests MULTINOMIAL_MEAN, MULTINOMIAL_SAMPLE, MULTINOMIAL_VARIANCE.
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
  b = 3;
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST111\n' );
  fprintf ( 1, '  For the Multinomial PDF:\n' );
  fprintf ( 1, '  MULTINOMIAL_MEAN computes the mean;\n' );
  fprintf ( 1, '  MULTINOMIAL_SAMPLE samples;\n' );
  fprintf ( 1, '  MULTINOMIAL_VARIANCE computes the variance;\n' );

  a = 5;

  c(1:3) = [ 0.125, 0.500, 0.375 ];

  check = multinomial_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST111 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = multinomial_mean ( a, b, c );
  variance = multinomial_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %6d\n', a );
  fprintf ( 1, '  PDF parameter B =             %6d\n', b );
  fprintf ( 1, '  PDF parameter C = \n' );
  for i = 1 : b
    fprintf ( 1, '  %14f\n', c(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF means and variances:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : b
    fprintf ( 1, '  %14f  %14f\n', mean(i), variance(i) );
  end
  
  for i = 1 : nsample
    [ x(1:b,i), seed ] = multinomial_sample ( a, b, c, seed );
  end

  xmax = i4row_max ( b, nsample, x );
  xmin = i4row_min ( b, nsample, x );
  mean = i4row_mean ( b, nsample, x );
  variance = i4row_variance ( b, nsample, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size = %6d\n', nsample );
  fprintf ( 1, '  Component Min, Max, Mean, Variance:\n' );
  for i = 1 : b
    fprintf ( 1, '  %6d  %6d  %6d  %14f  %14f\n', ... 
      i, xmin(i), xmax(i), mean(i), variance(i) );
  end

  return
end
