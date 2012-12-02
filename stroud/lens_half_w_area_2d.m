function value = lens_half_w_area_2d ( r, w )

%*****************************************************************************80
%
%% LENS_HALF_W_AREA_2D returns the area of a circular half lens in 2D.
%
%  Discussion:
%
%    A circular half lens is formed by drawing a circular arc, and joining its endpoints.
%    This particular half lens is described by the "width" of the region.  In other words,
%    it is the portion of the circle under water if the width
%    of the water surface is W.  There are two possible values for this
%    area, A and (PI*R**2-A).  The routine returns the smaller of the
%    two values.
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
%    Input, real W, the width of the half lens.
%
%    Output, real VALUE, the area of the half lens.
%
  if ( w <= 0.0E+00 )

    value = 0.0E+00;

  elseif ( 2.0E+00 * r <= w )

    value = 0.5E+00 * pi * r * r;

  else

    half_width = 0.5E+00 * w;
    h = r - sqrt ( r * r - half_width * half_width );
    angle = 2.0E+00 * atan2 ( half_width, r - h );
    sector = r * r * angle / 2.0E+00;
    triangle = ( r - h ) * half_width;
    value = sector - triangle;

  end

  return
end
