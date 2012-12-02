function asa266_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests PPND, R4_NORMAL_01_CDF_INVERSE, R8_NORMAL_01_CDF_INVERSE.
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
  ntest = 9;

  ifault = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PPND,\n' );
  fprintf ( 1, '  R4_NORMAL_01_CDF_INVERSE and\n' );
  fprintf ( 1, '  R8_NORMAL_01_CDF_INVERSE compute the percentage\n' );
  fprintf ( 1, '  points of the normal distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CDF, PPND(CDF), R4(CDF), R8(CDF)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    cdf = i / ( ntest + 1 );

    [ x1, ifault ] = ppnd ( cdf );
    x2 = r4_normal_01_cdf_inverse ( cdf );
    x3 = r8_normal_01_cdf_inverse ( cdf );

    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', cdf, x1, x2, x3 );

  end

  return
end
