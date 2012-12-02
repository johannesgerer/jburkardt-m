function prob_test135 ( )

%*****************************************************************************80
%
%% TEST135 tests SECH_CDF, SECH_CDF_INV, SECH_PDF.
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
  fprintf ( 1, 'TEST135\n' );
  fprintf ( 1, '  For the Hyperbolic Secant PDF:\n' );
  fprintf ( 1, '  SECH_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  SECH_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  SECH_PDF evaluates the PDF.\n' );

  a = 3.0;
  b = 2.0;

  check = sech_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST135 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =         %14f\n', a );
  fprintf ( 1, '  PDF parameter B =         %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = sech_sample ( a, b, seed );

    pdf = sech_pdf ( x, a, b );

    cdf = sech_cdf ( x, a, b );

    x2 = sech_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
