function area = sphere_imp_zone_area_3d ( r, h1, h2  )

%*****************************************************************************80
%
%% SPHERE_IMP_ZONE_AREA_3D computes the surface area of a spherical zone in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%    Draw any radius of the sphere and note the point P where the radius
%    intersects the sphere.  Now choose two points on the radius line, a
%    distance H1 and H2 from the point P.  Consider all the points on or within
%    the sphere whose projection onto the radius lies between these two points.
%    These points constitute the spherical zone, which can also be considered
%    the difference of two spherical caps.
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
%    Input, real R, the radius of the sphere.
%
%    Input, real H1, H2, the distances that define the 
%    thickness of the zone.  H1 and H2 must be between 0 and 2 * R.
%
%    Output, real AREA, the area of the spherical zone.
%
  h = abs ( h1 - h2 );

  if ( h <= 0.0 )
    area = 0.0;
  elseif ( 2.0 * r <= h )
    area = 4.0 * pi * r * r;
  else
    area = 2.0 * pi * r * h;
  end

  return
end
