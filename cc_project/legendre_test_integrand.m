function value = legendre_test_integrand ( x )

%*****************************************************************************80
%
%% LEGENDRE_TEST_INTEGRAND provides a test integrand for Legendre integrals.
%
%  Discussion:
%
%    The integral being approximated is
%      integral ( -1 <= x <= +1 ) 1/(x^4+x^2+0.9) dx
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
  value = 1.0 ./ ( x.^4 + x.^2 + 0.9 );

  return
end

