function prob_test1187 ( )

%*****************************************************************************80
%
%% PROB_TEST1187 tests NORMAL_TRUNCATED_A_MEAN, NORMAL_TRUNCATED_A_SAMPLE, NORMAL_TRUNCATED_A_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2013
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;
  seed = 123456789;
  a = 50.0;
  mu = 100.0;
  s = 25.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROB_TEST1187\n' );
  fprintf ( 1, '  For the Lower Truncated Normal PDF:\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_MEAN computes the mean;\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_SAMPLE samples;\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_VARIANCE computes the variance.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', s );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [%g,+oo]\n', a );

  mean = normal_truncated_a_mean ( mu, s, a );

  variance = normal_truncated_a_variance ( mu, s, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean      =               %g\n', mean );
  fprintf ( 1, '  PDF variance =                %g\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = normal_truncated_a_sample ( mu, s, a, seed );
  end

  mean = r8vec_mean ( sample_num, x );
  variance = r8vec_variance ( sample_num, x );
  [ xmax, imax ] = r8vec_max ( sample_num, x );
  [ xmin, imin ]  = r8vec_min ( sample_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %d\n', sample_num );
  fprintf ( 1, '  Sample mean =     %g\n', mean );
  fprintf ( 1, '  Sample variance = %g\n', variance );
  fprintf ( 1, '  Sample maximum =  %g\n', xmax );
  fprintf ( 1, '  Sample minimum =  %g\n', xmin );

  return
end