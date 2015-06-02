function ccff_asymptotic_test ( )

%*****************************************************************************80
%
%% CCFF_ASYMPTOTIC_TEST considers the Legendre integral of 1/(x^4+x^2+0.9).
%
%  Discussion:
%
%    The Legendre integral being approximated is
%      integral ( -1 <= x <= +1 ) f(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCFF_ASYMPTOTIC_TEST\n' );
  fprintf ( 1, '  Examine asymptotic quadrature error for Boyd''s\n' );
  fprintf ( 1, '  quadrature rule for the Legendre integral\n' );
  fprintf ( 1, '    I(f) = integral ( -1 <= x <= +1 ) f(x) dx\n' );
  fprintf ( 1, '  with\n' );
  fprintf ( 1, '    f(x) = 1 / (x^4+x^2+0.9)\n' );

  n_min = 5;
  n_inc = 5;
  n_max = 50;
  exact = legendre_test_integral ( );

  ccff_asymptotic ( n_min, n_inc, n_max, @legendre_test_integrand, exact );

  return
end
