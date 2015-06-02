function area = hypersphere_area ( m, r )

%*****************************************************************************80
%
%% HYPERSPHERE_AREA computes the surface area of an implicit sphere.
%
%  Discussion:
%
%    An implicit sphere in M dimensions satisfies the equation:
%
%      sum ( ( P(1:M) - CENTER(1:M) )^2 ) = R^2
%
%    DIM_NUM   Area
%
%    2      2       * PI   * R
%    3      4       * PI   * R^2
%    4      2       * PI^2 * R^3
%    5      (8/3)   * PI^2 * R^4
%    6                PI^3 * R^5
%    7      (16/15) * PI^3 * R^6
%
%    Sphere_Area ( M, R ) = 2 * PI^(M/2) * R^(M-1) / Gamma ( M / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real AREA, the area of the sphere.
%
  area = r^( m -1  ) * hypersphere_01_area ( m );

  return
end
