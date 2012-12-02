function prob_test028 ( )

%*****************************************************************************80
%
%% TEST028 tests CAUCHY_CDF, CAUCHY_CDF_INV, CAUCHY_PDF.
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
  fprintf ( 1, 'TEST028\n' );
  fprintf ( 1, '  For the Cauchy PDF:\n' );
  fprintf ( 1, '  CAUCHY_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  CAUCHY_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  CAUCHY_PDF evaluates the PDF;\n' );

  a = 2.0;
  b = 3.0;

  check = cauchy_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST028 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = cauchy_sample ( a, b, seed );

    pdf = cauchy_pdf ( x, a, b );

    cdf = cauchy_cdf ( x, a, b );

    x2 = cauchy_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
