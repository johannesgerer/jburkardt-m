function x = blend_r_0dn ( r, n, bound_r )

%*****************************************************************************80
%
%% BLEND_R_0DN extends vector data at endpoints into a line.
%
%  Diagram:
%
%    0-----r-----1
%
%  Discussion:
%
%    This is simply linear interpolation.  BLEND_R_0DN is provided
%    mainly as a "base routine" which can be compared to its
%    generalizations, such as BLEND_RS_0DN.
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
%    Input, real R, the (R) coordinate of the point to
%    be evaluated.
%
%    Input, integer N, the dimension of the vector space.
%
%    External, BOUND_R, is a function which is given (R) coordinates
%    and an component value I, and returns XI, the value of the I-th
%    component of the N-vector at that point.  BOUND_R will only be
%    called for "corners", that is, for values (R) where R is either
%    0.0 or 1.0.  BOUND_R has the form:
%      function xi = bound_r ( r, i )
%
%    Output, real X(N), the interpolated value at the point (R).
%
  for i = 1 : n
%
%  Get the I-th coordinate component at the two corners.
%
    x0 = bound_r ( 0.0, i );
    x1 = bound_r ( 1.0, i );
%
%  Interpolate the I-th coordinate component of the interior point.
%
    x(i) = blend_101 ( r, x0, x1 );

  end

  return
end
