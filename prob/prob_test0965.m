function prob_test0965 ( )

%*****************************************************************************80
%
%% TEST0965 tests LEVY_CDF, LEVY_CDF_INV, LEVY_PDF.
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
  fprintf ( 1, 'TEST0965\n' );
  fprintf ( 1, '  For the Levy PDF:\n' );
  fprintf ( 1, '  LEVY_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  LEVY_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  LEVY_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = levy_sample ( a, b, seed );

    pdf = levy_pdf ( x, a, b );

    cdf = levy_cdf ( x, a, b );

    x2 = levy_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
