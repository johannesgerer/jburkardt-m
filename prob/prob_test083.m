function prob_test083 ( )

%*****************************************************************************80
%
%% TEST083 tests GEOMETRIC_CDF, GEOMETRIC_PDF.
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
  fprintf ( 1, 'TEST083\n' );
  fprintf ( 1, '  For the Geometric PDF:\n' );
  fprintf ( 1, '  GEOMETRIC_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  GEOMETRIC_CDF evaluates the CDF.\n' );

  a = 0.25;

  check = geometric_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST083 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      PDF(X)      CDF(X)\n' );
  fprintf ( 1, '\n' );

  for x = 0 : 10
    pdf = geometric_pdf ( x, a );
    cdf = geometric_cdf ( x, a );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );
  end

  return
end
