function volume = sphere_imp_volume_nd ( dim_num, r )

%*****************************************************************************80
%
%% SPHERE_IMP_VOLUME_ND computes the volume of an implicit sphere in ND.
%
%  Discussion:
%
%    An implicit sphere in ND satisfies the equation:
%
%      sum ( ( X(1:N) - CENTER(1:N) )^2 ) = R^2
%
%    where R is the radius and CENTER is the center.
%
%    Results for the first few values of N are:
%
%    DIM_NUM  Volume
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
%    07 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real VOLUME, the volume of the sphere.
%
  volume = r^dim_num * sphere_unit_volume_nd ( dim_num );

  return
end
