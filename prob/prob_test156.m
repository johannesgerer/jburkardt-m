function prob_test156 ( )

%*****************************************************************************80
%
%% TEST156 tests WEIBULL_CDF, WEIBULL_CDF_INV, WEIBULL_PDF.
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
  fprintf ( 1, 'TEST156\n' );
  fprintf ( 1, '  For the Weibull PDF:\n' );
  fprintf ( 1, '  WEIBULL_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  WEIBULL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  WEIBULL_PDF evaluates the PDF;\n' );

  x = 3.0;

  a = 2.0;
  b = 3.0;
  c = 4.0;

  check = weibull_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST156 - Fatal error!\n' );
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

    [ x, seed ] = weibull_sample ( a, b, c, seed );

    pdf = weibull_pdf ( x, a, b, c );

    cdf = weibull_cdf ( x, a, b, c );

    x2 = weibull_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
