function prob_test060 ( )

%*****************************************************************************80
%
%% TEST060 tests EXPONENTIAL_01_CDF, EXPONENTIAL_01_CDF_INV, EXPONENTIAL_01_PDF;
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
  fprintf ( 1, 'TEST060\n' );
  fprintf ( 1, '  For the Exponential 01 PDF:\n' );
  fprintf ( 1, '  EXPONENTIAL_01_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  EXPONENTIAL_01_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  EXPONENTIAL_01_PDF evaluates the PDF.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = exponential_01_sample ( seed );

    pdf = exponential_01_pdf ( x );

    cdf = exponential_01_cdf ( x );

    x2 = exponential_01_cdf_inv ( cdf );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
