function exactness_test06 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST06 tests Gauss-Hermite rules for Hermite integrals.
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
  fprintf ( 1, 'EXACTNESS_TEST06\n' );
  fprintf ( 1, '  Test Gauss-Hermite rules on Hermite integrals.\n' );
  fprintf ( 1, '  Density function rho(x) = exp(-x^2).\n' );
  fprintf ( 1, '  Region: -oo < x < +oo.\n' );
  fprintf ( 1, '  Exactness: 2N-1.\n' );

  for n = 1 : 5

    [ x, w ] = hermite_set ( n );
    p_max = 2 * n;
    hermite_exactness ( n, x, w, p_max );

  end

  return
end
