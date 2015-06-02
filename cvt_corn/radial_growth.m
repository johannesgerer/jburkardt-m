function [ r, p_xy, p_type ] = radial_growth ( r, np, p_xy, p_type )

%*****************************************************************************80
%
%% RADIAL_GROWTH simulates the radial expansion of the region.
%
%  Discussion:
%
%    On input, points with negative P_TYPE were just added.
%
%    The radius must be expanded so that the arc length per point ratio
%    is preserved.
%
%    All negative values of P_TYPE become positive.
%
%    All points move outward radially.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, integer NP, the number of points.
%
%    Input, real P_XY(2,NP), the point coordinates.
%
%    Input, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%    -1, the point is a new point, constrained to the circle.
%    -2, the point is a new point, constrained to the disk.
%
%    Output, real R, the updated radius.
%
%    Output, real P_XY(2,NP), the updated point coordinates.
%
%    Output, integer P_TYPE(NP), the updated types.
%

%
%  Discover the growth factor.
%
  c = find ( p_type == 1 );
  nc = length ( c );

  c_new = find ( abs ( p_type ) == 1 );
  nc_new = length ( c_new );

  factor = nc_new / nc;
%
%  Make all types positive.
%
  p_type(1:np) = abs ( p_type(1:np) );
%
%  Expand the radius and the coordinates.
%
  r = factor * r;
  p_xy(1:2,1:np) = factor * p_xy(1:2,1:np);

  return
end

  
