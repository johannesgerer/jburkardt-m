function fx1 = p03_fx1 ( x )

%*****************************************************************************80
%
%% P03_FX1 evaluates the derivative of the function for problem 3.
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
  fx1 = exp ( - x ) * ( 1.0 - x );

  return
end
