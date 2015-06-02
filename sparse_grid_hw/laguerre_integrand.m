function value = laguerre_integrand ( x )

%*****************************************************************************80
%
%% LAGUERRE_INTEGRAND evaluates an integrand for the Laguerre integral.
%
%  Discussion:
%
%    The integral being approximated is
%      integral ( 0 <= x < +oo ) f(x) exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the integrand.
%
  value = x ./ ( exp ( x ) - 1.0 );

  return
end

