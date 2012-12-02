function prob_test021 ( )

%*****************************************************************************80
%
%% TEST021 tests BINOMIAL_CDF, BINOMIAL_CDF_INV, BINOMIAL_PDF;
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
  fprintf ( 1, 'TEST021\n' );
  fprintf ( 1, '  For the Binomial PDF:\n' );
  fprintf ( 1, '  BINOMIAL_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BINOMIAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BINOMIAL_PDF evaluates the PDF;\n' );

  a = 5;
  b = 0.65;

  check = binomial_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST021 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = binomial_sample ( a, b, seed );

    pdf = binomial_pdf ( x, a, b );

    cdf = binomial_cdf ( x, a, b );

    x2 = binomial_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
