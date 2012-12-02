function prob_test1344 ( )

%*****************************************************************************80
%
%% TEST1344 tests RUNS_MEAN, RUNS_VARIANCE;
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
  fprintf ( 1, 'TEST1344\n' );
  fprintf ( 1, '  For the RUNS PDF:\n' );
  fprintf ( 1, '  RUNS_MEAN computes the mean;\n' );
  fprintf ( 1, '  RUNS_VARIANCE computes the variance\n' );

  m = 10;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter M = %14f\n', m );
  fprintf ( 1, '  PDF parameter N = %14f\n', n );

  mean = runs_mean ( m, n );
  variance = runs_variance ( m, n );

  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = runs_sample ( m, n, seed );
  end

  mean = i4vec_mean ( nsample, x );
  variance = i4vec_variance ( nsample, x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %6d\n', xmax );
  fprintf ( 1, '  Sample minimum =  %6d\n', xmin );

  return
end
