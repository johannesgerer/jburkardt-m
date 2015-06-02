function value = h_integral ( n )

%*****************************************************************************80
%
%% H_INTEGRAL evaluates the integral of H(i,x).
%
%  Discussion:
%
%    H(i,x) is the physicist's Hermite polynomial of degree I.
%
%    The integral computed is:
%
%      integral ( -oo < x < +oo ) H(i,x) exp(-x^2) dx
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

    value = r8_factorial2 ( n - 1 ) * sqrt ( pi ) / 2.0^( n / 2 );

  end

  return
end
