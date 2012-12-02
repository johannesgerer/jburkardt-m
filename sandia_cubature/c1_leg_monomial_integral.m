function value = c1_leg_monomial_integral ( expon )

%*****************************************************************************80
%
%% C1_LEG_MONOMIAL_INTEGRAL: integral of monomial with Legendre weight on C1.
%
%  Discussion:
%
%    C1_LEG is the interval [-1,+1] with the Legendre weight function
%
%      w(x) = 1.
%
%    value = integral ( -1 <= x <= +1 ) x^expon dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2010
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
%    Output, real VALUE, the value of the integral.
%
  if ( expon < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C1_LEG_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  EXPON < 0.\n' );
    error ( 'C1_LEG_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( mod ( expon, 2 ) == 1 )
    value = 0.0;
    return
  end

  value = 2.0 / ( expon + 1 );

  return
end
