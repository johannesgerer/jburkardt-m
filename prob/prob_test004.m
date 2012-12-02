function test004 ( )

%*****************************************************************************80
%
%% TEST004 tests ANGLIT_CDF, ANGLIT_CDF_INV, ANGLIT_PDF.
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
  fprintf ( 1, 'TEST004\n' );
  fprintf ( 1, '  For the Anglit PDF:\n' );
  fprintf ( 1, '  ANGLIT_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  ANGLIT_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  ANGLIT_PDF evaluates the PDF;\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = anglit_sample ( seed );

    pdf = anglit_pdf ( x );

    cdf = anglit_cdf ( x );

    x2 = anglit_cdf_inv ( cdf );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
