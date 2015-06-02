function volume = hypersphere_volume ( m, r )

%*****************************************************************************80
%
%% HYPERSPHERE_VOLUME computes the volume of a hypersphere.
%
%  Discussion:
%
%    A hypersphere in M dimensions satisfies the equation:
%
%      sum ( ( X(1:M) - CENTER(1:M) )^2 ) = R^2
%
%    where R is the radius and CENTER is the center.
%
%    Results for the first few values of N are:
%
%    M     Volume
%    -     -----------------------
%    2                PI   * R^2
%    3     (4/3)    * PI   * R^3
%    4     (1/2)    * PI^2 * R^4
%    5     (8/15)   * PI^2 * R^5
%    6     (1/6)    * PI^3 * R^6
%    7     (16/105) * PI^3 * R^7
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
%    Output, real VOLUME, the volume of the sphere.
%
  volume = r^m * hypersphere_01_volume ( m );

  return
end
