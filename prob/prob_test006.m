function test006 ( )

%*****************************************************************************80
%
%% TEST006 tests ARCSIN_CDF, ARCSIN_CDF_INV, ARCSIN_PDF.
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
  fprintf ( 1, 'TEST006\n' );
  fprintf ( 1, '  For the Arcsin PDF:\n' );
  fprintf ( 1, '  ARCSIN_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  ARCSIN_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  ARCSIN_PDF evaluates the PDF;\n' );

  a = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );

  if ( ~arcsin_check ( a ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST006 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = arcsin_sample ( a, seed );

    pdf = arcsin_pdf ( x, a );

    cdf = arcsin_cdf ( x, a );

    x2 = arcsin_cdf_inv ( cdf, a );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
