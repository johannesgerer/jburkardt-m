function prob_test015 ( )

%*****************************************************************************80
%
%% TEST015 tests BETA_BINOMIAL_CDF, BETA_BINOMIAL_CDF_INV, BETA_BINOMIAL_PDF.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST015\n' );
  fprintf ( 1, '  For the Beta Binomial PDF,\n' );
  fprintf ( 1, '  BETA_BINOMIAL_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BETA_BINOMIAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BETA_BINOMIAL_PDF evaluates the PDF;\n' );

  a = 2.0;
  b = 3.0;
  c = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %6d', c );

  check = beta_binomial_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST015 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = beta_binomial_sample ( a, b, c, seed );

    pdf = beta_binomial_pdf ( x, a, b, c );

    cdf = beta_binomial_cdf ( x, a, b, c );

    x2 = beta_binomial_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
