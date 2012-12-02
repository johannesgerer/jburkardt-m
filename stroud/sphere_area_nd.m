function value = sphere_area_nd ( n, r )

%*****************************************************************************80
%
%% SPHERE_AREA_ND computes the area of a sphere in ND.
%
%  Integration region:
%
%    Points X(1:N) such that
%
%      Sum ( X(1:N)**2 ) = R**2
%
%  Discussion:
%
%    N   Area
%
%    2   2       * PI    * R
%    3   4       * PI    * R**2
%    4   2       * PI**2 * R**3
%    5   (8/3)   * PI**2 * R**4
%    6             PI**3 * R**5
%    7   (16/15) * PI**3 * R**6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real SPHERE_AREA_ND, the area of the sphere.
%
  value = sphere_unit_area_nd ( n ) * r^( n - 1 );

  return
end
