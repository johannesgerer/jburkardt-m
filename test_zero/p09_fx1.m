function fx1 = p09_fx1 ( x )

%*****************************************************************************80
%
%% P09_FX1 evaluates the derivative of the function for problem 9.
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
  x2 = x - 6.25;

  if ( x2 < - 0.25 )
    fx1 = 0.75;
  elseif ( x2 < 0.25 )
    fx1 = 2.0;
  else
    fx1 = 0.75;
  end

  return
end
