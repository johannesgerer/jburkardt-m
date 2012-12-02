function prob_test062 ( )

%*****************************************************************************80
%
%% TEST062 tests EXPONENTIAL_CDF, EXPONENTIAL_CDF_INV, EXPONENTIAL_PDF;
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
  fprintf ( 1, 'TEST062\n' );
  fprintf ( 1, '  For the Exponential CDF:\n' );
  fprintf ( 1, '  EXPONENTIAL_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  EXPONENTIAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  EXPONENTIAL_PDF evaluates the PDF.\n' );

  a = 1.0;
  b = 2.0;

  check = exponential_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST062 - Fatal error!\n' );
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

    [ x, seed  ] = exponential_sample ( a, b, seed );

    pdf = exponential_pdf ( x, a, b );

    cdf = exponential_cdf ( x, a, b );

    x2 = exponential_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
