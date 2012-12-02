function exact = chebyshev2_integral ( expon )

%*****************************************************************************80
%
%% CHEBYSHEV2_INTEGRAL evaluates a monomial Chebyshev type 2 integral.
%
%  Discussion:
%
%    To test a Chebyshev type 2 quadrature rule, we use it to approximate the
%    integral of a monomial:
%
%      integral ( -1 <= x <= +1 ) x^n * sqrt ( 1 - x^2 ) dx
%
%    This routine is given the value of the exponent, and returns the
%    exact value of the integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2008
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

%
%  Get the exact value of the integral.
%
  if ( mod ( expon, 2 ) == 0 )

    top = 1;
    bot = 1;
    for i = 2 : 2 : expon
      top = top * ( i - 1 );
      bot = bot *   i;
    end

	bot = bot * ( expon + 2 );

    exact = pi * top / bot;

  else

    exact = 0.0;
	
  end

  return
end
