function exactness_test07 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST07 tests Gauss-Hermite rules for Hermite integrals.
%
%  Discussion:
%
%    Instead of the usual density rho(x)=exp(-x*x), these rules apply to
%    approximating the integral:
%      I(f) = integral ( -oo < x < +oo ) f(x) dx
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
  fprintf ( 1, 'EXACTNESS_TEST07\n' );
  fprintf ( 1, '  Test Gauss-Hermite rules on Hermite integrals.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -oo < x < +oo.\n' );
  fprintf ( 1, '  Exactness: 2N-1.\n' );

  for n = 1 : 5

    [ x, w ] = hermite_1_set ( n );
%
%  Standardize the rule by multiplying every weight w(i) by exp(-x(i)^2).
%
    w(1:n) = exp ( - x(1:n) .* x(1:n) ) .* w(1:n);
%
%  Now test the rule in standard form.
%
    p_max = 2 * n;
    hermite_exactness ( n, x, w, p_max );

  end

  return
end

