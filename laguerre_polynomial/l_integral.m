function value = l_integral ( n )

%*****************************************************************************80
%
%% L_INTEGRAL evaluates a monomial integral associated with L(n,x).
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x < +oo ) x^n * exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the exponent.
%    0 <= N.
%
%    Output, real VALUE, the value of the integral.
%
  value = r8_factorial ( n );

  return
end
