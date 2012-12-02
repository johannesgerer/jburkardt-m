function prob_test1486 ( )

%*****************************************************************************80
%
%% TEST1486 tests UNIFORM_01_MEAN, *_SAMPLE, *_VARIANCE.
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
  fprintf ( 1, 'TEST1486\n' );
  fprintf ( 1, '  For the Uniform 01 PDF:\n' );
  fprintf ( 1, '  UNIFORM_01_MEAN computes mean;\n' );
  fprintf ( 1, '  UNIFORM_01_SAMPLE samples;\n' );
  fprintf ( 1, '  UNIFORM_01_VARIANCE computes variance.\n' );

  mean = uniform_01_mean ( );
  variance = uniform_01_variance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean =            %14f\n', mean );
  fprintf ( 1, '  PDF variance =        %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = uniform_01_sample ( seed );
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
