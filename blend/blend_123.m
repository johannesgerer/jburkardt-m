function x = blend_123 ( r, s, t, x000, x001, x010, x011, x100, x101, x110, ...
  x111, xr00, xr01, xr10, xr11, x0s0, x0s1, x1s0, x1s1, x00t, x01t, x10t, ...
  x11t, x0st, x1st, xr0t, xr1t, xrs0, xrs1 )

%*****************************************************************************80
%
%% BLEND_123 extends scalar face data into a cube.
%
%
%  Diagram:
%
%    010-----r10-----110        011-----r11-----111
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    0s0.....rs0.....1s0        0s1.....rs1.....1s1     S
%      |       .       |          |       .       |     |
%      |       .       |          |       .       |     |
%    000-----r00-----100        001-----r01-----101     +----R
%           BOTTOM                      TOP
%
%    011-----0s1-----001        111-----1s1-----101
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    01t.....0st.....00t        11t.....1st.....10t          T
%      |       .       |          |       .       |          |
%      |       .       |          |       .       |          |
%    010-----0s0-----000        110-----1s0-----100     S----+
%           LEFT                       RIGHT
%
%    001-----r01-----101        011-----r11-----111
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    00t.....r0t.....100        01t.....r1t.....11t     T
%      |       .       |          |       .       |     |
%      |       .       |          |       .       |     |
%    000-----r00-----100        010-----r10-----110     +----R
%           FRONT                       BACK
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
%    Input, real R, S, T, the coordinates where an interpolated
%    value is desired.
%
%    Input, real X000, X001, X010, X011, X100, X101, X110,
%    X111, the data values at the corners.
%
%    Input, real XR00, XR01, XR10, XR11, X0S0, X0S1, X1S0,
%    X1S1, X00T, X01T, X10T, X11T, the data values at points along the edges.
%
%    Input, real X0ST, X1ST, XR0T, XR1T, XRS0, XRS1, the
%    data values at points on the faces.
%
%    Output, real X, the interpolated data value at (R,S,T).
%
%
%  Interpolate the interior point.
%
  x =        ( 1.0 - r ) * ( 1.0 - s ) * ( 1.0 - t ) * x000 ...
           - ( 1.0 - r ) * ( 1.0 - s )               * x00t ...
           + ( 1.0 - r ) * ( 1.0 - s ) *         t   * x001 ...
           - ( 1.0 - r )               * ( 1.0 - t ) * x0s0 ...
           + ( 1.0 - r )                             * x0st ...
           - ( 1.0 - r )                   *     t   * x0s1 ...
           + ( 1.0 - r ) *         s   * ( 1.0 - t ) * x010 ...
           - ( 1.0 - r ) *         s                 * x01t ...
           + ( 1.0 - r ) *         s   *         t   * x011 ...
           -               ( 1.0 - s ) * ( 1.0 - t ) * xr00 ...
           +               ( 1.0 - s )               * xr0t ...
           -               ( 1.0 - s ) *         t   * xr01 ...
           +                             ( 1.0 - t ) * xrs0 ...
           +                                     t   * xrs1 ...
           -                       s   * ( 1.0 - t ) * xr10 ...
           +                       s                 * xr1t ...
           -                       s   *         t   * xr11 ...
           +         r   * ( 1.0 - s ) * ( 1.0 - t ) * x100 ...
           -         r   * ( 1.0 - s )               * x10t ...
           +         r   * ( 1.0 - s ) *         t   * x101 ...
           -         r                 * ( 1.0 - t ) * x1s0 ...
           +         r                               * x1st ...
           -         r                 *         t   * x1s1 ...
           +         r   *         s   * ( 1.0 - t ) * x110 ...
           -         r   *         s                 * x11t ...
           +         r   *         s   *         t   * x111;

  return
end
