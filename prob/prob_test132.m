function prob_test132 ( )

%*****************************************************************************80
%
%% TEST132 tests RAYLEIGH_MEAN, RAYLEIGH_SAMPLE, RAYLEIGH_VARIANCE.
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
  fprintf ( 1, 'TEST132\n' );
  fprintf ( 1, '  For the Rayleigh PDF:\n' );
  fprintf ( 1, '  RAYLEIGH_MEAN computes the mean;\n' );
  fprintf ( 1, '  RAYLEIGH_SAMPLE samples;\n' );
  fprintf ( 1, '  RAYLEIGH_VARIANCE computes the variance.\n' );

  a = 2.0;

  check = rayleigh_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST132 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = rayleigh_mean ( a );
  variance = rayleigh_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = rayleigh_sample ( a, seed );
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
