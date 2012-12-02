function fx1 = p18_fx1 ( x )

%*****************************************************************************80
%
%% P18_FX1 evaluates the derivative of the function for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX1(*), the value of the derivative at X.
%
  fx1 = 10.0^14 * ( ...
          7 * x.^6 ...
      -  42 * x.^5 ...
      + 105 * x.^4 ...
      - 140 * x.^3 ...
      + 105 * x.^2 ...
      -  42 * x.^1 ...
      +   7 );

  return
end
