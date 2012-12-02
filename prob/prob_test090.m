function prob_test090 ( )

%*****************************************************************************80
%
%% TEST090 tests HYPERGEOMETRIC_CDF, HYPERGEOMETRIC_PDF.
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
  fprintf ( 1, 'TEST090\n' );
  fprintf ( 1, '  For the Hypergeometric PDF:\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_PDF evaluates the PDF.\n' );

  x = 7;

  n = 100;
  m = 70;
  l = 1000;

  check = hypergeometric_check ( n, m, l );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST090 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  pdf = hypergeometric_pdf ( x, n, m, l );

  cdf = hypergeometric_cdf ( x, n, m, l );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X =                %6d\n', x );
  fprintf ( 1, '  Total number of balls =         %6d\n', l );
  fprintf ( 1, '  Number of white balls =         %6d\n', m );
  fprintf ( 1, '  Number of balls taken =         %6d\n', n );
  fprintf ( 1, '  PDF value =                   = %14f\n', pdf );
  fprintf ( 1, '  CDF value =                   = %14f\n', cdf );

  return
end
