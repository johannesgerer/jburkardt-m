function value = lens_half_h_area_2d ( r, h )

%*****************************************************************************80
%
%% LENS_HALF_H_AREA_2D returns the area of a circular half lens in 2D.
%
%  Discussion:
%
%    A circular half lens is formed by drawing a circular arc, and joining its endpoints.
%    This particular half lens is described by the "height" of the region.  In other words,
%    it is the area that would be submerged if a circle of radius
%    R were standing in water of depth H.
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
%    Input, real R, the radius of the circle.
%
%    Input, real H, the height of the half lens.
%
%    Output, real VALUE, the area of the half lens.
%
  if ( h <= 0.0E+00 )

    value = 0.0E+00;

  elseif ( 2.0E+00 * r <= h )

    value = pi * r * r;

  else

    half_width = sqrt ( h * ( 2.0E+00 * r - h ) );
    angle = 2.0E+00 * atan2 ( half_width, r - h );
    sector = r * r * angle / 2.0E+00;
    triangle = ( r - h ) * half_width;
    value = sector - triangle;

  end

  return
end
