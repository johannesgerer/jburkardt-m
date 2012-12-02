function prob_test079 ( )

%*****************************************************************************80
%
%% TEST079 tests GENLOGISTIC_CDF, GENLOGISTIC_CDF_INV, GENLOGISTIC_PDF.
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
  fprintf ( 1, 'TEST079\n' );
  fprintf ( 1, '  For the Generalized Logistic PDF:\n' );
  fprintf ( 1, '  GENLOGISTIC_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  GENLOGISTIC_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  GENLOGISTIC_CDF_INV inverts the CDF.\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;

  check = genlogistic_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST079 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = genlogistic_sample ( a, b, c, seed );

    pdf = genlogistic_pdf ( x, a, b, c );

    cdf = genlogistic_cdf ( x, a, b, c );

    x2 = genlogistic_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
