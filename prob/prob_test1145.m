function prob_test1145 ( )

%*****************************************************************************80
%
%% TEST1145 tests NEGATIVE_BINOMIAL_CDF, NEGATIVE_BINOMIAL_CDF_INV, NEGATIVE_BINOMIAL_PDF.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1145\n' );
  fprintf ( 1, '  For the Negative Binomial PDF:\n' );
  fprintf ( 1, '  NEGATIVE_BINOMIAL_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  NEGATIVE_BINOMIAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  NEGATIVE_BINOMIAL_PDF evaluates the PDF.\n' );

  a = 2;
  b = 0.25;

  if ( ~negative_binomial_check ( a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST1145 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = negative_binomial_sample ( a, b, seed );

    pdf = negative_binomial_pdf ( x, a, b );

    cdf = negative_binomial_cdf ( x, a, b );

    x2 = negative_binomial_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
