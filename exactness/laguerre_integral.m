function s = laguerre_integral ( p )

%*****************************************************************************80
%
%% LAGUERRE_INTEGRAL evaluates a monomial integral associated with L(n,x).
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x < +oo ) x^p * exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the exponent.
%    0 <= P.
%
%    Output, real S, the value of the integral.
%
  s = r8_factorial ( p );

  return
end

