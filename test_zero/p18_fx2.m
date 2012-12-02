function fx2 = p18_fx2 ( x )

%*****************************************************************************80
%
%% P18_FX2 evaluates the second derivative of the function for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX2(*), the value of the second derivative at X.
%
  fx2 = 10.0^14 * ( ...
         42 * x.^5 ...
      - 210 * x.^4 ...
      + 420 * x.^3 ...
      - 420 * x.^2 ...
      + 210 * x    ...
      -  42 );

  return
end
