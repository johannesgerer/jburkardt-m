function prob_test084 ( )

%*****************************************************************************80
%
%% TEST084 tests GOMPERTZ_CDF, GOMPERTZ_CDF_INV, GOMPERTZ_PDF.
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
  fprintf ( 1, 'TEST084\n' );
  fprintf ( 1, '  For the Gompertz PDF:\n' );
  fprintf ( 1, '  GOMPERTZ_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  GOMPERTZ_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  GOMPERTZ_PDF evaluates the PDF;\n' );

  a = 2.0;
  b = 3.0;

  check = gompertz_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST084 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =       %14f\n', a );
  fprintf ( 1, '  PDF parameter B =       %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = gompertz_sample ( a, b, seed );

    pdf = gompertz_pdf ( x, a, b );

    cdf = gompertz_cdf ( x, a, b );

    x2 = gompertz_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
