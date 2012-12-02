function x = blend_113 ( r, s, t, x000, x001, x010, x011, x100, x101, x110, ...
  x111, xr00, xr01, xr10, xr11, x0s0, x0s1, x1s0, x1s1, x00t, x01t, x10t, ...
  x11t )

%*****************************************************************************80
%
%% BLEND_113 extends scalar line data into a cube.
%
%  Diagram:
%
%     011-----r11-----111
%      |               |
%      |               |
%     0s1             1s1
%      |               |
%      |               |
%     001-----r01-----101
%
%
%     01t-------------11t
%      |               |
%      |               |
%      |      rst      |
%      |               |
%      |               |
%     00t-------------10t
%
%
%     010-----r10-----110
%      |               |
%      |               |
%     0s0             1s0
%      |               |
%      |               |
%     000-----r00-----100
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
%    Output, real X, the interpolated data value at (R,S,T).
%

%
%  Interpolate the points in the centers of the faces.
%
  x0st = blend_112 ( s, t, x000, x001, x010, x011, x0s0, x0s1, x00t, x01t );
  x1st = blend_112 ( s, t, x100, x101, x110, x111, x1s0, x1s1, x10t, x11t );
  xr0t = blend_112 ( r, t, x000, x001, x100, x101, xr00, xr01, x00t, x10t );
  xr1t = blend_112 ( r, t, x010, x011, x110, x111, xr10, xr11, x01t, x11t );
  xrs0 = blend_112 ( r, s, x000, x010, x100, x110, xr00, xr10, x0s0, x1s0 );
  xrs1 = blend_112 ( r, s, x001, x011, x101, x111, xr01, xr11, x0s1, x1s1 );
%
%  Interpolate the I-th coordinate component of the interior point.
%
  x = blend_123 ( r, s, t, x000, x001, x010, x011, x100, x101, x110, x111, ...
    xr00, xr01, xr10, xr11, x0s0, x0s1, x1s0, x1s1, x00t, x01t, x10t, x11t, ...
    x0st, x1st, xr0t, xr1t, xrs0, xrs1 );

  return
end
