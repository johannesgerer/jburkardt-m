function prob_test153 ( )

%*****************************************************************************80
%
%% TEST153 tests UNIFORM_DISCRETE_CDF, UNIFORM_DISCRETE_PDF.
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
  fprintf ( 1, 'TEST153\n' );
  fprintf ( 1, '  For the Uniform discrete PDF.\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_CDF evaluates the CDF.\n' );

  a = 1;
  b = 6;

  check = uniform_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST153 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %6d\n', a );
  fprintf ( 1, '  PDF parameter B =             %6d\n', b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      PDF(X)      CDF(X)\n' );
  fprintf ( 1, '\n' );

  for x = 0 : 6
    pdf = uniform_discrete_pdf ( x, a, b );
    cdf = uniform_discrete_cdf ( x, a, b );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );
  end

  return
end
