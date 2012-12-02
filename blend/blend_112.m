function x = blend_112 ( r, s, x00, x01, x10, x11, xr0, xr1, x0s, x1s )

%*****************************************************************************80
%
%% BLEND_112 extends scalar line data into a square.
%
%  Diagram:
%
%    01-----r1-----11
%     |      .      |
%     |      .      |
%    0s.....rs.....1s
%     |      .      |
%     |      .      |
%    00-----r0-----10
%
%  Formula:
%
%    Written in terms of R and S, the interpolation map has the form:
%
%      X(R,S) =
%               1     * ( - x00       + x0s                   + xr0 )
%             + r     * (   x00       - x0s - x10       + x1s )
%             + s     * (   x00 - x01                         - xr0 + xr1 )
%             + r * s * ( - x00 + x01       + x10 - x11 )
%
%    Written in terms of the data, the map has the form:
%
%      X(R,S) =
%             - ( 1 - r ) * ( 1 - s ) * x00
%             + ( 1 - r )             * x0s
%             - ( 1 - r ) *       s   * x01
%             +             ( 1 - s ) * xr0
%             +                   s   * xr1
%             -       r   * ( 1 - s ) * x10
%             +       r               * x1s
%             -       r   *       s   * x11
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
%    Input, real R, S, the coordinates where an interpolated
%    value is desired.
%
%    Input, real X00, X01, X10, X11, the data values
%    at the corners.
%
%    Input, real XR0, XR1, X0S, X1S, the data values at
%    points along the edges corresponding to (R,0), (R,1), (0,S) and (1,S).
%
%    Output, real X, the interpolated data value at (R,S).
%
  x = - ( 1.0 - r ) * ( 1.0 - s ) * x00 ...
      + ( 1.0 - r )               * x0s ...
      - ( 1.0 - r ) *         s   * x01 ...
      +               ( 1.0 - s ) * xr0 ...
      +                       s   * xr1 ...
      -         r   * ( 1.0 - s ) * x10 ...
      +         r                 * x1s ...
      -         r   *         s   * x11;

  return
end
