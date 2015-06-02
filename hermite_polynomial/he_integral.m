function value = he_integral ( n )

%*****************************************************************************80
%
%% HE_INTEGRAL evaluates the integral of He(i,x).
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
%
%    The integral computed is:
%
%      integral ( -oo < x < +oo ) He(i,x) exp(-x^2/2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the integral.
%    0 <= N.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( n, 2 ) == 1 )

    value = 0.0;

  else

    value = r8_factorial2 ( n - 1 ) * sqrt ( 2.0 * pi );

  end

  return
end
