function prob_test144 ( )

%*****************************************************************************80
%
%% TEST144 tests TRIANGLE_MEAN, TRIANGLE_SAMPLE, TRIANGLE_VARIANCE;
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
  fprintf ( 1, 'TEST144\n' );
  fprintf ( 1, '  For the Triangle PDF:\n' );
  fprintf ( 1, '  TRIANGLE_MEAN returns the mean;\n' );
  fprintf ( 1, '  TRIANGLE_SAMPLE samples;\n' );
  fprintf ( 1, '  TRIANGLE_VARIANCE returns the variance;\n' );

  a = 1.0;
  b = 3.0;
  c = 10.0;

  check = triangle_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST144 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );

  mean = triangle_mean ( a, b, c );
  variance = triangle_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MEAN =          %14f\n', mean );
  fprintf ( 1, '  PDF parameter VARIANCE =      %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = triangle_sample ( a, b, c, seed );
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
