function truncated_normal_a_cdf_inv_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_CDV_INV_TEST tests TRUNCATED_NORMAL_A_CDF_INV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2015
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
  fprintf ( 1, 'TRUNCATED_NORMAL_A_CDF_INV_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_A_CDF_INV inverts the CDF\n' );
  fprintf ( 1, '  for the lower Truncated Normal Distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', sigma );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [%g,+00)\n', a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            CDF           CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : sample_num
    [ x, seed ] = truncated_normal_a_sample ( mu, sigma, a, seed );
    cdf = truncated_normal_a_cdf ( x, mu, sigma, a );
    x2 = truncated_normal_a_cdf_inv ( cdf, mu, sigma, a );
    fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', x, cdf, x2 );
  end

  return
end
