function exactness_test04 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST04 tests Gauss-Laguerre rules for Laguerre integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST04\n' );
  fprintf ( 1, '  Test Gauss-Laguerre rules on Laguerre integrals.\n' );
  fprintf ( 1, '  Density function rho(x) = exp(-x).\n' );
  fprintf ( 1, '  Region: 0 <= x < +oo.\n' );
  fprintf ( 1, '  Exactness: 2N-1.\n' );

  for n = 1 : 5

    [ x, w ] = laguerre_set ( n );
    p_max = 2 * n;
    laguerre_exactness ( n, x, w, p_max );

  end

  return
end
