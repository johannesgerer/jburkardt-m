function exact = legendre_integral ( expon )

%*****************************************************************************80
%
%% LEGENDRE_INTEGRAL evaluates a monomial Legendre integral.
%
%  Discussion:
%
%    The integral:
%
%      integral ( -1 <= x <= +1 ) x^n dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%
%    Output, real EXACT, the value of the exact integral.
%
  if ( mod ( expon, 2 ) == 0 )

    exact = 2.0 / ( expon + 1 );
	
  else

    exact = 0.0;
	
  end

  return
end
