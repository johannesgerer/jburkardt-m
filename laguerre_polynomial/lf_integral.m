function value = lf_integral ( n, alpha )

%*****************************************************************************80
%
%% LF_INTEGRAL evaluates a monomial integral associated with Lf(n,alpha,x).
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x < +oo ) x^n * x^alpha * exp ( -x ) dx
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
%    Input, real ALPHA, the exponent of X in the weight function.
%
%    Output, real VALUE, the value of the integral.
%
  arg = alpha + n + 1;

  exact = r8_gamma ( arg );

  return
end
