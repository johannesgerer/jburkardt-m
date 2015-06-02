function s = legendre_integral ( p )

%*****************************************************************************80
%
%% LEGENDRE_INTEGRAL evaluates a monomial Legendre integral.
%
%  Discussion:
%
%    To test a Legendre quadrature rule, we use it to approximate the
%    integral of a monomial:
%
%      integral ( -1 <= x <= +1 ) x^p dx
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
%    16 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the power.
%
%    Output, real S, the value of the exact integral.
%

%
%  Get the exact value of the integral.
%
  if ( mod ( p, 2 ) == 0 )
  
    s = 2.0 / ( p + 1 );
	
  else
  
    s = 0.0;
	
  end

  return
end
