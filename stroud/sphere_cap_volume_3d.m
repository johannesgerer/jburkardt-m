function volume = sphere_cap_volume_3d ( r, h )

%*****************************************************************************80
%
%% SPHERE_CAP_VOLUME_3D computes the volume of a spherical cap in 3D.
%
%  Discussion:
%
%    Draw any radius of the sphere and note the point P where the radius
%    intersects the sphere.  Consider the point on the radius line which is
%    H units from P.  Draw the circle that lies in the plane perpendicular to
%    the radius, and which intersects the sphere.  The circle divides the sphere
%    into two pieces, and the corresponding disk divides the solid sphere into
%    two pieces.  The part of the solid sphere that includes the point P
%    is the spherical cap of height (or thickness) H.
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
%    Output, real VOLUME, the volume of the spherical cap.
%
  if ( h <= 0.0 )
    volume = 0.0;
  elseif ( 2.0 * r <= h )
    volume = ( 4.0 / 3.0 ) * pi * r * r * r;
  else
    volume = ( 1.0 / 3.0 ) * pi * h * h * ( 3.0 * r - h );
  end

  return
end
