function prob_test1186 ( )

%*****************************************************************************80
%
%% PROB_TEST1186 tests NORMAL_TRUNCATED_A_CDF, NORMAL_TRUNCATED_A_CDF_INV, NORMAL_TRUNCATED_A_PDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2013
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;
  a = 50.0;
  mu = 100.0;
  s = 25.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROB_TEST1186\n' );
  fprintf ( 1, '  For the Lower Truncated Normal PDF:\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_A_PDF evaluates the PDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', s );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [%g,+oo)\n', a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n');

  for i = 1 : 10

    [ x, seed ] = normal_truncated_a_sample ( mu, s, a, seed );

    pdf = normal_truncated_a_pdf ( x, mu, s, a );

    cdf = normal_truncated_a_cdf ( x, mu, s, a );

    x2 = normal_truncated_a_cdf_inv ( cdf, mu, s, a );

    fprintf( 1, '  %14g  %14g  %14g  %14g\n', x, pdf, cdf, x2 );

  end

  return
end