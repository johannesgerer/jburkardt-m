function volume = sphere_cap_volume_2d ( r, h )

%*****************************************************************************80
%
%% SPHERE_CAP_VOLUME_2D computes the volume of a spherical cap in 2D.
%
%  Discussion:
%
%    Draw any radius R of the circle and denote as P the point where the
%    radius intersects the circle.  Now consider the point Q which lies
%    on the radius and which is H units from P.  The line which is
%    perpendicular to the radius R and passes through Q divides the
%    circle into two pieces.  The piece including the point P is the
%    spherical (circular) cap of height (or thickness) H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real H, the "height" of the spherical cap.  H must
%    be between 0 and 2 * R.
%
%    Output, real VOLUME, the volume (area) of the spherical cap.
%
  if ( h <= 0.0 )

    volume = 0.0;

  elseif ( 2.0 * r <= h )

    volume = pi * r * r;

  else

    theta = 2.0 * r8_asin ( sqrt ( r * r - ( r - h )^2 ) / r );
    volume = r * r * ( theta - sin ( theta ) ) / 2.0;

    if ( r < h )
      volume = pi * r * r - volume;
    end

  end

  return
end
