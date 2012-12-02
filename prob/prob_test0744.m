function prob_test0744 ( )

%*****************************************************************************80
%
%% TEST0744 tests FRECHET_CDF, FRECHET_CDF_INV and FRECHET_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
  seed = 1213456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0744\n' );
  fprintf ( 1, '  For the Frechet PDF:\n' );
  fprintf ( 1, '  FRECHET_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  FRECHET_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  FRECHET_PDF evaluates the PDF;\n' );

  alpha = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter ALPHA =         %f\n', alpha );

  fprintf ( 1, '\n' );
  fprintf ( 1,'       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = frechet_sample ( alpha, seed );

    pdf = frechet_pdf ( x, alpha );

    cdf = frechet_cdf ( x, alpha );

    x2 = frechet_cdf_inv ( cdf, alpha );

    fprintf ( 1, '  %12f  %12f  %12f  %12f\n',x, pdf, cdf, x2 );

  end

  return
end
