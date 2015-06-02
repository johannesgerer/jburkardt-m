function integral = line01_monomial_integral ( e )

%*****************************************************************************80
%
%% LINE01_MONOMIAL_INTEGRAL: monomial integral over the unit line in 1D.
%
%  Discussion:
%
%    The integration region is 
%
%      0 <= X <= 1.
%
%    The monomial is F(X) = X^E.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Academic Press, 1984, page 263.
%
%  Parameters:
%
%    Input, integer E, the exponent.
%    E must not equal -1.
%
%    Output, real INTEGRAL, the integral.
%
  if ( e == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  Exponent E = -1 is not allowed!\n' );
    error ( 'LINE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  integral = 1.0 / ( e + 1 );

  return
end
