function prob_test1188 ( )

%*****************************************************************************80
%
%% PROB_TEST1188 tests NORMAL_TRUNCATED_B_CDF, NORMAL_TRUNCATED_B_CDF_INV, NORMAL_TRUNCATED_B_PDF;
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
  b = 150.0;
  mu = 100.0;
  s = 25.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROB_TEST1188\n' );
  fprintf ( 1, '  For the Upper Truncated Normal PDF:\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_B_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_B_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  NORMAL_TRUNCATED_B_PDF evaluates the PDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean =               %g\n', mu );
  fprintf ( 1, '    standard deviation = %g\n', s );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [-oo,%g]\n', b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n');

  for i = 1 : 10

    [ x, seed ] = normal_truncated_b_sample ( mu, s, b, seed );

    pdf = normal_truncated_b_pdf ( x, mu, s, b );

    cdf = normal_truncated_b_cdf ( x, mu, s, b );

    x2 = normal_truncated_b_cdf_inv ( cdf, mu, s, b );

    fprintf( 1, '  %14g  %14g  %14g  %14g\n', x, pdf, cdf, x2 );

  end

  return
end