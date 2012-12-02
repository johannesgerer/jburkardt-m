function value = t_integral ( e )

%*****************************************************************************80
%
%% T_INTEGRAL: integral ( -1 <= x <= +1 ) x^e dx / sqrt ( 1 - x^2 ).
%
%  Discussion:
%
%    Set 
%      x = cos ( theta ), 
%      dx = - sin ( theta ) d theta = - sqrt ( 1 - x^2 ) d theta
%    to transform the integral to
%      integral ( 0 <= theta <= pi ) - ( cos ( theta ) )^e d theta
%    which becomes
%      0 if E is odd,
%      (1/2^e) * choose ( e, e/2 ) * pi if E is even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer E, the exponent of X.
%    0 <= E.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( e, 2 ) == 1 )

    value = 0.0;

  else

    value = nchoosek ( e, e / 2 ) * pi / 2^e;

  end

  return
end