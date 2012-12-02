function prob_test097 ( )

%*****************************************************************************80
%
%% TEST097 tests LOGISTIC_CDF, LOGISTIC_CDF_INV, LOGISTIC_PDF.
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
  fprintf ( 1, 'TEST097\n' );
  fprintf ( 1, '  For the Logistic PDF:\n' );
  fprintf ( 1, '  LOGISTIC_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  LOGISTIC_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  LOGISTIC_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 2.0;

  check = logistic_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST097 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = logistic_sample ( a, b, seed );

    pdf = logistic_pdf ( x, a, b );

    cdf = logistic_cdf ( x, a, b );

    x2 = logistic_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
