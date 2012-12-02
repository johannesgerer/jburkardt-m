function prob_test058 ( )

%*****************************************************************************80
%
%% TEST058 tests ERLANG_MEAN, ERLANG_SAMPLE, ERLANG_VARIANCE.
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
  fprintf ( 1, 'TEST058\n' );
  fprintf ( 1, '  For the Erlang PDF:\n' );
  fprintf ( 1, '  ERLANG_MEAN computes the mean;\n' );
  fprintf ( 1, '  ERLANG_SAMPLE samples;\n' );
  fprintf ( 1, '  ERLANG_VARIANCE computes the variance.\n' );

  a = 1.0;
  b = 2.0;
  c = 3;

  check = erlang_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST058 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = erlang_mean ( a, b, c );
  variance = erlang_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %6d\n', c );
  fprintf ( 1, '  PDF mean =     %14f\n', mean );
  fprintf ( 1, '  PDF variance = %14f\n', variance );

  for i = 1 : nsample
    [ x(i), seed ] = erlang_sample ( a, b, c, seed );
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
