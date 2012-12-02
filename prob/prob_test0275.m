function prob_test0275 ( )

%*****************************************************************************80
%
%% TEST0275 tests CARDIOID_CDF, CARDIOID_CDF_INV and CARDIOID_PDF.
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
  a = 0.0;
  b = 0.25;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0275\n' );
  fprintf ( 1, '  For the Cardioid PDF:\n' );
  fprintf ( 1, '  CARDIOID_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  CARDIOID_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  CARDIOID_PDF evaluates the PDF;\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %f\n', a );
  fprintf ( 1, '  PDF parameter B = %f\n', b );

  if ( ~cardioid_check ( a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = cardioid_sample ( a, b, seed );
    pdf = cardioid_pdf ( x, a, b );
    cdf = cardioid_cdf ( x, a, b );
    x2 = cardioid_cdf_inv ( cdf, a, b );

    fprintf ( 1,'  %12f  %12f  %12f  %12f\n', x, pdf, cdf, x2 );

  end

  return
end
