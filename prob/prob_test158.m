function prob_test158 ( )

%*****************************************************************************80
%
%% TEST158 tests WEIBULL_DISCRETE_CDF, WEIBULL_DISCRETE_CDF_INV, WEIBULL_DISCRETE_PDF.
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
  fprintf ( 1, 'TEST158\n' );
  fprintf ( 1, '  For the Weibull Discrete PDF,\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_PDF evaluates the PDF;\n' );

  a = 0.50;
  b = 1.5;

  check = weibull_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST158 - Fatal error!\n' );
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

    [ x, seed ] = weibull_discrete_sample ( a, b, seed );

    pdf = weibull_discrete_pdf ( x, a, b );

    cdf = weibull_discrete_cdf ( x, a, b );

    x2 = weibull_discrete_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
