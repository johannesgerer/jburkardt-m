function prob_test106 ( )

%*****************************************************************************80
%
%% TEST106 tests LORENTZ_CDF,LORENTZ_CDF_INV, LORENTZ_PDF.
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
  fprintf ( 1, 'TEST106\n' );
  fprintf ( 1, '  For the Lorentz PDF:\n' );
  fprintf ( 1, '  LORENTZ_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  LORENTZ_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  LORENTZ_PDF evaluates the PDF;\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = lorentz_sample ( seed );

    pdf = lorentz_pdf ( x );

    cdf = lorentz_cdf ( x );

    x2 = lorentz_cdf_inv ( cdf );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
