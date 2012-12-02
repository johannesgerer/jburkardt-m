function fx2 = p03_fx2 ( x )

%*****************************************************************************80
%
%% P03_FX2 evaluates the second derivative of the function for problem 3.
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
%    Output, real FX2, the second derivative of the function at X.
%
  fx2 = exp ( - x ) * ( x - 2.0 );

  return
end
