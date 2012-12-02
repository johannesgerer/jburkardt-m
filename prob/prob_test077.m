function prob_test077 ( )

%*****************************************************************************80
%
%% TEST077 tests GAMMA_CDF, GAMMA_PDF.
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
  a = 1.0;
  b = 1.5;
  c = 3.0;

  check = gamma_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST077 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST077\n' );
  fprintf ( 1, '  For the Gamma PDF:\n' );
  fprintf ( 1, '  GAMMA_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  GAMMA_PDF evaluates the PDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  PDF   CDF\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10

    x = i / 5.0;

    cdf = gamma_cdf ( x, a, b, c );

    pdf = gamma_pdf ( x, a, b, c );

    fprintf ( 1, '  %12f  %12f  %12f\n', x, pdf, cdf );

  end

  return
end
