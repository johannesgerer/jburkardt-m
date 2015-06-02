function area = sphere_cap_area_2d ( r, h )

%*****************************************************************************80
%
%% SPHERE_CAP_AREA_2D computes the surface area of a spherical cap in 2D.
%
%  Discussion:
%
%    Draw any radius of the sphere and note the point P where the radius
%    intersects the sphere.  Consider the point on the radius line which is
%    H units from P.  Draw the circle that lies in the plane perpendicular to
%    the radius, and which intersects the sphere.  The circle divides the sphere
%    into two pieces, and the corresponding disk divides the solid sphere into
%    two pieces.  The spherical cap is the part of the solid sphere that
%    includes the point P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real H, the "height" of the spherical cap. 
%
%    Output, real AREA, the area of the spherical cap.
%
  if ( h <= 0.0 )
    area = 0.0;
  elseif ( 2.0 * r <= h )
    area = 2.0 * pi * r;
  else

    theta = 2.0 * r8_asin ( sqrt ( r * r - ( r - h ) * ( r - h ) ) / r );

    area = r * theta;

    if ( r <= h )
      area = 2.0 * pi * r - area;
    end

  end

  return
end
