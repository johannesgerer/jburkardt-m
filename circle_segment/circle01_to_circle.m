function x = circle01_to_circle ( alpha, r, c, n, x )

%*****************************************************************************80
%
%% CIRCLE01_TO_CIRCLE maps points from the unit circle to a general one.
%
%  Discussion:
%
%    To map data, defined in the unit circle, to a circle with radius R
%    and center C, and to rotate the original data by an angle of ALPHA first,
%
%      X = R * ( cos(alpha) -sin(alpha) ) * X + CX
%      Y       ( sin(alpha)  cos(alpha) )   Y   CY
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the angle, in radians, by which the unit circle
%    data should be rotated.
%
%    Input, real R, the scale factor by which the unit circle data
%    should be stretched.
%
%    Input, real C(2,1), the translation to be applied.
%
%    Input, integer N, the number of points to transform.
%
%    Input/output, real X(2,N), the points to be transformed.
%

%
%  Rotation:
%
%  Don't write "cos ( alpha )" instead of "cos(alpha)" because Matlab's
%  bebuggered automatic array creator thinks blanks separate matrix elements!
%
  rot = [ cos(alpha), -sin(alpha); ...
          sin(alpha),  cos(alpha) ];

  x(1:2,1:n) = c(1:2,1:2) * x(1:2,1:n);
%
%  Dilation:
%
  x(1:2,1:n) = r * x(1:2,1:n);
%
%  Translation:
%
  x(1:2,1:n) = x(1:2,1:n) + repmat ( c(1:2,1), 1, n );

  return
end

