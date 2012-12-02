function x = blend_103 ( r, s, t, x000, x001, x010, x011, x100, x101, x110, ...
  x111 )

%*****************************************************************************80
%
%% BLEND_103 extends scalar point data into a cube.
%
%  Diagram:
%
%    011--------------111
%      |               |
%      |               |
%      |               |
%      |               |
%      |               |
%    001--------------101
%
%
%      *---------------*
%      |               |
%      |               |
%      |      rst      |
%      |               |
%      |               |
%      *---------------*
%
%
%    010--------------110
%      |               |
%      |               |
%      |               |
%      |               |
%      |               |
%    000--------------100
%
%
%  Formula:
%
%    Written as a polynomial in R, S and T, the interpolation map has the
%    form:
%
%      X(R,S,T) =
%        1         * ( + x000 )
%      + r         * ( - x000 + x100 )
%      +     s     * ( - x000        + x010 )
%      +         t * ( - x000               + x001 )
%      + r * s     * ( + x000 - x100 - x010                       + x110 )
%      + r     * t * ( + x000 - x100        - x001        + x101 )
%      +     s * t * ( + x000        - x010 - x001 + x011 )
%      + r * s * t * ( - x000 + x100 + x010 + x001 - x011 - x101 - x110 + x111 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
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
%    Input, real R, S, T, the coordinates where an
%    interpolated value is desired.
%
%    Input, real X000, X001, X010, X011, X100, X101, X110,
%    X111, the data values at the corners.
%
%    Output, real X, the interpolated data value at (R,S,T).
%

%
%  Interpolate the interior point.
%
  x = ...
    1.0         * ( + x000 ) ...
    + r         * ( - x000 + x100 ) ...
    +     s     * ( - x000        + x010 ) ...
    +         t * ( - x000               + x001 ) ...
    + r * s     * ( + x000 - x100 - x010                      + x110 ) ...
    + r     * t * ( + x000 - x100        - x001        + x101 ) ...
    +     s * t * ( + x000        - x010 - x001 + x011 ) ...
    + r * s * t * ( - x000 + x100 + x010 + x001 - x011 - x101 - x110 + x111 );

  return
end
