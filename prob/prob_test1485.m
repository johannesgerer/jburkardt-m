function prob_test1485 ( )

%*****************************************************************************80
%
%% TEST1485 tests UNIFORM_01_CDF, UNIFORM_01_CDF_INV, UNIFORM_01_PDF;
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
  fprintf ( 1, 'TEST1485\n' );
  fprintf ( 1, '  For the Uniform 01 PDF:\n' );
  fprintf ( 1, '  UNIFORM_01_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  UNIFORM_01_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  UNIFORM_01_PDF evaluates the PDF;\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = uniform_01_sample ( seed );

    pdf = uniform_01_pdf ( x );

    cdf = uniform_01_cdf ( x );

    x2 = uniform_01_cdf_inv ( cdf );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
