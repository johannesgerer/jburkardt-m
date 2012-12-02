function prob_test026 ( )

%*****************************************************************************80
%
%% TEST026 tests BURR_CDF, BURR_CDF_INV, BURR_PDF.
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
  fprintf ( 1, 'TEST026\n' );
  fprintf ( 1, '  For the Burr PDF:\n' );
  fprintf ( 1, '  BURR_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BURR_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BURR_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;
  d = 2.0;

  check = burr_check ( a, b, c, d );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST026 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %14f\n', c );
  fprintf ( 1, '  PDF parameter D = %14f\n', d );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = burr_sample ( a, b, c, d, seed );

    pdf = burr_pdf ( x, a, b, c, d );

    cdf = burr_cdf ( x, a, b, c, d );

    x2 = burr_cdf_inv ( cdf, a, b, c, d );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
