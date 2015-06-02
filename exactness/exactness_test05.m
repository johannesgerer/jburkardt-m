function exactness_test05 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST05 tests Gauss-Laguerre rules for Laguerre integrals with rho=1.
%
%  Discussion:
%
%    Instead of the usual density rho(x)=exp(-x), these rules apply to
%    approximating the integral:
%      I(f) = integral ( 0 <= x < +oo ) f(x) dx
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
  fprintf ( 1, 'EXACTNESS_TEST05\n' );
  fprintf ( 1, '  Test Gauss-Laguerre quadrature rules on Laguerre integrals.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: 0 <= x < +oo.\n' );
  fprintf ( 1, '  Exactness: 2N-1.\n' );

  for n = 1 : 5

    [ x, w ] = laguerre_1_set ( n );
%
%  Standardize the rule by multiplying every weight w(i) by exp(-x(i)).
%
    w(1:n) = exp ( - x(1:n) ) .* w(1:n);
%
%  Now test the rule in standard form.
%
    p_max = 2 * n;
    laguerre_exactness ( n, x, w, p_max );

  end

  return
end
