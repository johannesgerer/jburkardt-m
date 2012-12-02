function prob_test143 ( )

%*****************************************************************************80
%
%% TEST143 tests TRIANGLE_CDF, TRIANGLE_CDF_INV, TRIANGLE_PDF;
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
  fprintf ( 1, 'TEST143\n' );
  fprintf ( 1, '  For the Triangle PDF:\n' );
  fprintf ( 1, '  TRIANGLE_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  TRIANGLE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  TRIANGLE_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 3.0;
  c = 10.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =      %14f\n', a );
  fprintf ( 1, '  PDF parameter B =      %14f\n', b );
  fprintf ( 1, '  PDF parameter C =      %14f\n', c );

  check = triangle_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST143 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = triangle_sample ( a, b, c, seed );

    pdf = triangle_pdf ( x, a, b, c );

    cdf = triangle_cdf ( x, a, b, c );

    x2 = triangle_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
