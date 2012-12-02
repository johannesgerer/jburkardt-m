function asa266_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests ALNORM, NORMP, NPROB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 16;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  ALNORM,\n' );
  fprintf ( 1, '  NORMP, and\n' );
  fprintf ( 1, '  NPROB are routines that compute the cumulative\n' );
  fprintf ( 1, '  density function for the normal distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  CDF1  1-CDF1\n' );
  fprintf ( 1, '     CDF2  1-CDF2  PDF2\n' );
  fprintf ( 1, '     CDF3  1-CDF3  PDF3\n' );

  for i = 1 : ntest

    x = 3.0 * ( i - 1 ) / ( ntest - 1 );

    upper = 0;
    cdf1 = alnorm ( x, upper );

    upper = 1;
    ccdf1 = alnorm ( x, upper );

    [ cdf2, ccdf2, pdf2 ] = normp ( x );

    [ cdf3, ccdf3, pdf3 ] = nprob ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, cdf1, ccdf1 );
    fprintf ( 1, '                %12f  %12f  %12f\n', cdf2, ccdf2, pdf2 );
    fprintf ( 1, '                %12f  %12f  %12f\n', cdf3, ccdf3, pdf3 );

  end

  return
end
