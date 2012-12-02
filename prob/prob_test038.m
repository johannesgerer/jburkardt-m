function prob_test038 ( )

%*****************************************************************************80
%
%% TEST038 tests COSINE_CDF, COSINE_CDF_INV, COSINE_PDF.
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
  fprintf ( 1, 'TEST038\n' );
  fprintf ( 1, '  For the Cosine PDF:\n' );
  fprintf ( 1, '  COSINE_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  COSINE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  COSINE_PDF evaluates the PDF.\n' );

  a = 2.0;
  b = 1.0;

  check = cosine_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST038 - Fatal error!\n' );
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

    [ x, seed ] = cosine_sample ( a, b, seed );

    pdf = cosine_pdf ( x, a, b );

    cdf = cosine_cdf ( x, a, b );

    x2 = cosine_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
