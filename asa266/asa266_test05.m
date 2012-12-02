function asa266_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests ALNGAM, ALOGAM, R8_GAMMA_LOG, LNGAMMA;
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
  ntest = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  ALNGAM,\n' );
  fprintf ( 1, '  ALOGAM,\n' );
  fprintf ( 1, '  R8_GAMMA_LOG, and\n' );
  fprintf ( 1, '  LNGAMMA compute the logarithm of the gamma function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  ALNGAM  ALOGAM  R8_GAMMA_LOG LNGAMMA\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    x = i / ntest;

    [ log1, ifault ] = alngam ( x );
    [ log2, ifault ] = alogam ( x );
    log3 = r8_gamma_log ( x );
    [ log4, ifault ] = lngamma ( x );

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', ...
      x, log1, log2, log3, log4 );

  end

  return
end
