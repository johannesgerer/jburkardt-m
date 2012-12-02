function value = p_integral ( n )

%*****************************************************************************80
%
%% P_INTEGRAL evaluates a monomial integral associated with P(n,x).
%
%  Discussion:
%
%    The integral:
%
%      integral ( -1 <= x < +1 ) x^n dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
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
  if ( mod ( n, 2 ) == 1 )
    value = 0.0;
  else
    value = 2.0 / ( n + 1 );
  end

  return
end
