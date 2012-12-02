function x = blend_102 ( r, s, x00, x01, x10, x11 )

%*****************************************************************************80
%
%% BLEND_102 extends scalar point data into a square.
%
%  Diagram:
%
%    01------------11
%     |      .      |
%     |      .      |
%     |.....rs......|
%     |      .      |
%     |      .      |
%    00------------10
%
%  Formula:
%
%    Written in terms of R and S, the map has the form:
%
%      X(R,S) =
%               1     * ( + x00 )
%             + r     * ( - x00 + x10 )
%             + s     * ( - x00       + x01 )
%             + r * s * ( + x00 - x10 - x01 + x11 )
%
%    Written in terms of the coefficients, the map has the form:
%
%      X(R,S) = x00 * ( 1 - r - s + r * s )
%             + x01 * (         s - r * s )
%             + x10 * (     r     - r * s )
%             + x11 * (             r * s )
%
%             = x00 * ( 1 - r ) * ( 1 - s )
%             + x01 * ( 1 - r ) *       s
%             + x10 *       r   * ( 1 - s )
%             + x11 *       r           s
%
%    The nonlinear term ( r * s ) has an important role:
%
%      If ( x01 + x10 - x00 - x11 ) is zero, then the input data lies in
%      a plane, and the mapping is affine.  All the interpolated data
%      will lie on the plane defined by the four corner values.  In
%      particular, on any line through the square, data values at
%      intermediate points will lie between the values at the endpoints.
%
%      If ( x01 + x10 - x00 - x11 ) is not zero, then the input data does
%      not lie in a plane, and the interpolation map is nonlinear.  On
%      any line through the square, data values at intermediate points
%      may lie above or below the data values at the endpoints.  The
%      size of the coefficient of r * s will determine how severe this
%      effect is.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Gordon,
%    Blending-Function Methods of Bivariate and Multivariate Interpolation
%    and Approximation,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 1, March 1971, pages 158-177.
%
%    William Gordon and Charles Hall,
%    Transfinite Element Methods: Blending-Function Interpolation over
%    Arbitrary Curved Element Domains,
%    Numerische Mathematik,
%    Volume 21, Number 1, 1973, pages 109-129.
%
%    William Gordon and Charles Hall,
%    Construction of Curvilinear Coordinate Systems and Application to
%    Mesh Generation,
%    International Journal of Numerical Methods in Engineering,
%    Volume 7, 1973, pages 461-477.
%
%    Joe Thompson, Bharat Soni, Nigel Weatherill,
%    Handbook of Grid Generation,
%    CRC Press, 1999.
%
%  Parameters:
%
%    Input, real R, S, the coordinates where an
%    interpolated value is desired.
%
%    Input, real X00, X01, X10, X11, the data values
%    at the corners.
%
%    Output, real X, the interpolated data value at (R,S).
%
  x =             + x00 ...
      + r *     ( - x00 + x10 ) ...
      + s *     ( - x00       + x01 ) ...
      + r * s * ( + x00 - x10 - x01 + x11 );

  return
end
