function asa266_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests TRIGAMMA.
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
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  TRIGAMMA computes the trigamma function:\n' );
  fprintf ( 1, '    trigamma(X) = d^2 ( Log ( Gamma ( X ) ) ) / dX^2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  TRIGAMMA\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    x = i / ntest;

    t = trigamma ( x );
    fprintf ( 1, '  %12f  %12f\n', x, t );

  end

  return
end
