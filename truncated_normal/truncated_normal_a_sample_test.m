function truncated_normal_a_sample_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_SAMPLE_TEST tests TRUNCATED_NORMAL_A_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2015
%
%  Author:
%
%    John Burkardt
%
  sample_num = 10;
  seed = 123456789;
  a = 50.0;
  mu = 100.0;
  sigma = 25.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_A_SAMPLE_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_A_SAMPLE samples\n' );
  fprintf ( 1, '  the lower Truncated Normal Distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', sigma );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [%g,+oo)\n', a );
  fprintf ( 1, '\n' );

  for i = 1 : sample_num
    [ x, seed ] = truncated_normal_a_sample ( mu, sigma, a, seed );
    fprintf ( 1, '  %2d  %14.6g\n', i, x );
  end

  return
end
