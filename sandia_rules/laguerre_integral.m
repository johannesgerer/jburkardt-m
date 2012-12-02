function exact = laguerre_integral ( expon )

%*****************************************************************************80
%
%% LAGUERRE_INTEGRAL evaluates a monomial Laguerre integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( 0 <= x < +oo ) x^n * exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real EXACT, the value of the integral.
%
  exact = r8_factorial ( expon );

  return
end
