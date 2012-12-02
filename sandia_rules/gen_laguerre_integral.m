function exact = gen_laguerre_integral ( expon, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_INTEGRAL evaluates a monomial generalized Laguerre integral.
%
%  Discussion:
%
%    The integral being computed is
%
%      integral ( 0 <= x < +oo ) x^n * x^alpha * exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2008
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
%    Input, real ALPHA, the exponent of X in the weight function.
%
%    Output, real EXACT, the value of the integral.
%
  exact = gamma ( alpha + expon + 1 );

  return
end
