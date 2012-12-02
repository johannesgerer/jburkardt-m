function prob_test074 ( )

%*****************************************************************************80
%
%% TEST074 tests FOLDED_NORMAL_MEAN, FOLDED_NORMAL_SAMPLE, FOLDED_NORMAL_VARIANCE.
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
  fprintf ( 1, 'TEST074\n' );
  fprintf ( 1, '  For the Folded Normal PDF:\n' );
  fprintf ( 1, '  FOLDED_NORMAL_MEAN computes the mean;\n' );
  fprintf ( 1, '  FOLDED_NORMAL_SAMPLE samples;\n' );
  fprintf ( 1, '  FOLDED_NORMAL_VARIANCE computes the variance.\n' );

  a = 2.0;
  b = 3.0;

  check = folded_normal_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST074 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = folded_normal_mean ( a, b );
  variance = folded_normal_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = folded_normal_sample ( a, b, seed );
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
