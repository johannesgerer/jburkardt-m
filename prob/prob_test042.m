function prob_test042 ( )

%*****************************************************************************80
%
%% TEST042 tests DERANGED_CDF, DERANGED_PDF.
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
  a = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST042\n' );
  fprintf ( 1, '  For the Deranged PDF:\n' );
  fprintf ( 1, '  DERANGED_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  DERANGED_CDF evaluates the CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X    PDF(X)      CDF(X)\n' );
  fprintf ( 1, '\n' );

  check = deranged_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST042 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  for x = 0 : a
    pdf = deranged_pdf ( x, a );
    cdf = deranged_cdf ( x, a );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );
  end

  return
end
