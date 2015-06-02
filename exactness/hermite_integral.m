function s = hermite_integral ( p )

%*****************************************************************************80
%
%% HERMITE_INTEGRAL evaluates a monomial Hermite integral.
%
%  Discussion:
%
%    Integral ( -oo < x < +oo ) x^p exp(-x^2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the exponent. 
%    0 <= P.
%
%    Output, real S, the value of the integral.
%
  if ( mod ( p, 2 ) == 0 )
    s = r8_factorial2 ( p - 1 ) * sqrt ( pi ) / 2.0 ^ ( p / 2 );
  else
    s = 0.0;
  end

  return
end
