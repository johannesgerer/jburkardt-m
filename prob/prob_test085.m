function prob_test085 ( )

%*****************************************************************************80
%
%% TEST085 tests GOMPERTZ_SAMPLE;
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
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  For the Gompertz PDF:\n' );
  fprintf ( 1, '  GOMPERTZ_SAMPLE samples;\n' );

  a = 2.0;
  b = 3.0;

  check = gompertz_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST085 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =       %14f\n', a );
  fprintf ( 1, '  PDF parameter B =       %14f\n', b );
  
  for i = 1 : nsample
    [ x(i), seed ] = gompertz_sample ( a, b, seed );
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
