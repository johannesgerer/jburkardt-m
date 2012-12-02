function prob_test109 ( )

%*****************************************************************************80
%
%% TEST109 tests MAXWELL_MEAN, MAXWELL_SAMPLE, MAXWELL_VARIANCE.
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
  fprintf ( 1, 'TEST109\n' );
  fprintf ( 1, '  For the Maxwell PDF:\n' );
  fprintf ( 1, '  MAXWELL_MEAN computes the mean;\n' );
  fprintf ( 1, '  MAXWELL_VARIANCE computes the variance;\n' );
  fprintf ( 1, '  MAXWELL_SAMPLE samples.\n' );

  a = 2.0;

  if ( ~maxwell_check ( a ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST109 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = maxwell_mean ( a );
  variance = maxwell_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF mean =                    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = maxwell_sample ( a, seed );
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
