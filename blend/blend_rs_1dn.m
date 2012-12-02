function x = blend_rs_1dn ( r, s, n, bound_rs )

%*****************************************************************************80
%
%% BLEND_RS_1DN extends vector data along sides into a square.
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
%  Discussion:
%
%    BLEND_RS_1DN is NOT equivalent to a bilinear finite element method,
%    since the data is sampled everywhere along the boundary lines,
%    rather than at a finite number of nodes.
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
%    Input, real R, S, the (R,S) coordinates of the point to be
%    evaluated.
%
%    Input, integer N, the dimension of the vector space.
%
%    External, BOUND_RS, is a function which is given (R,S)
%    coordinates and an component value I, and returns XI, the value
%    of the I-th component of the N-vector at that point.  BOUND_RS
%    will only be called for "sides", that is, for values (R,S) where
%    at least one of R and S is either 0.0 or 1.0.  BOUND_RS has the
%    form:
%      function xi = bound_rs ( r, s, i )
%
%    Output, real X(N), the interpolated value at the point (R,S).
%
  for i = 1 : n
%
%  Get the I-th coordinate component at the four corners.
%
    x00 = bound_rs ( 0.0, 0.0, i );
    x01 = bound_rs ( 0.0, 1.0, i );
    x10 = bound_rs ( 1.0, 0.0, i );
    x11 = bound_rs ( 1.0, 1.0, i );
%
%  Get the I-th coordinate component at the sides.
%
    xr0 = bound_rs ( r, 0.0, i );
    xr1 = bound_rs ( r, 1.0, i );
    x0s = bound_rs ( 0.0, s, i );
    x1s = bound_rs ( 1.0, s, i );
%
%  Interpolate the I-th coordinate component of the interior point.
%
    x(i) = blend_112 ( r, s, x00, x01, x10, x11, xr0, xr1, x0s, x1s );

  end

  return
end
