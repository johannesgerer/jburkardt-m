function fx1 = p12_fx1 ( x )

%*****************************************************************************80
%
%% P12_FX1 evaluates the derivative of the function for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the abscissa.
%
%    Output, real FX1, the first derivative of the function at X.
%
  factor = 1000.0

  if ( x == 1.0 )
    fx1 = 0.0;
  else
    y = x - 1.0;
    fx1 = factor * exp ( - 1.0 / y.^2 ) * ( y.^2 + 2.0 ) / y.^2
  end
