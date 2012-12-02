function asa266_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests DIGAMMA, R8_PSI.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  digamma(X) = d ( Log ( Gamma ( X ) ) ) / dX.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIGAMMA and\n' );
  fprintf ( 1, '  R8_PSI compute the digamma function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  DIGAMMA   R8_PSI\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    x = i / ntest;

    fprintf ( 1, '  %12f  %12f  %12f\n', x, digamma ( x ), r8_psi ( x ) );

  end

  return
end
