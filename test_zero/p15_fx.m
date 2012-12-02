function fx = p15_fx ( x )

%*****************************************************************************80
%
%% P15_FX evaluates a pathological function for Newton's method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Donovan, Arnold Miller, Timothy Moreland,
%    Pathological Functions for Newton's Method,
%    American Mathematical Monthly, January 1993, pages 53-58.
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  
  fx = ( 2 * ( x > 0 ) - 1 ) .* abs ( x ).^(1/3) .* exp ( - x.^2 );

  return
end
