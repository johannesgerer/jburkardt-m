function y = frunge ( x )

%*****************************************************************************80
%
%% FRUNGE sets the Runge data values.
%
%  Discussion:
%
%    Interpolation of the Runge function at evenly spaced points
%    in [-1,1] is a common test.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real FRUNGE, the value of the derivative of the Runge function.
%
  y = 1.0E+00 ./ ( 1.0E+00 + 25.0E+00 * x .* x );

  return
end
