function prob_test102 ( )

%*****************************************************************************80
%
%% TEST102 tests LOG_SERIES_CDF, LOG_SERIES_PDF.
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
  fprintf ( 1, 'TEST102\n' );
  fprintf ( 1, '  For the Logseries PDF:\n' );
  fprintf ( 1, '  LOG_SERIES_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  LOG_SERIES_PDF evaluates the PDF.\n' );

  x = 2;

  a = 0.25;

  check = log_series_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST102 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X   PDF(X)       CDF(X)\n' );
  fprintf ( 1, '\n' );

  for x = 1 : 10
    pdf = log_series_pdf ( x, a );
    cdf = log_series_cdf ( x, a );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );
  end

  return
end
