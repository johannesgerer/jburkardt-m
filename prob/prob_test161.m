function prob_test161 ( )

%*****************************************************************************80
%
%% TEST161 tests ZIPF_CDF, ZIPF_PDF.
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
  fprintf ( 1, 'TEST161\n' );
  fprintf ( 1, '  For the Zipf PDF:\n' );
  fprintf ( 1, '  ZIPF_PDF evaluates the PDF.\n' );
  fprintf ( 1, '  ZIPF_CDF evaluates the CDF.\n' );

  a = 2.0;

  check = zipf_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST161 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X    PDF(X)       CDF(X)\n' );
  fprintf ( 1, '\n' );

  for x = 1 : 20

    pdf = zipf_pdf ( x, a );
    cdf = zipf_cdf ( x, a );
    fprintf ( 1, '  %6d  %14f  %14f\n', x, pdf, cdf );

  end

  return
end
