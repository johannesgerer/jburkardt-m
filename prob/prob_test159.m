function prob_test159 ( )

%*****************************************************************************80
%
%% TEST159 tests WEIBULL_DISCRETE_CDF, WEIBULL_DISCRETE_PDF.
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
  fprintf ( 1, 'TEST159\n' );
  fprintf ( 1, '  For the Weibull Discrete PDF:\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_PDF evaluates the PDF;\n' );
  fprintf ( 1, '  WEIBULL_DISCRETE_CDF evaluates the CDF.\n' );

  a = 0.50;
  b = 1.5;

  check = weibull_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST159 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =     %14f\n', a );
  fprintf ( 1, '  PDF parameter B =     %14f\n', b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      PDF(X)      CDF(X)\n' );
  fprintf ( 1, '\n' );

  for x = 0 : 10
    pdf = weibull_discrete_pdf ( x, a, b );
    cdf = weibull_discrete_cdf ( x, a, b );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );
  end

  return
end
