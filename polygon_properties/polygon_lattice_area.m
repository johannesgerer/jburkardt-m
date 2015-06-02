function area = polygon_lattice_area ( i, b )

%*****************************************************************************80
%
%% POLYGON_LATTICE_AREA computes the area of a lattice polygon.
%
%  Discussion:
%
%    We define a lattice to be the 2D plane, in which the points
%    whose (X,Y) coordinates are both integers are given a special
%    status as "lattice points".
%
%    A lattice polygon is a polygon whose vertices are lattice points.
%
%    The area of a lattice polygon can be computed by Pick's Theorem:
%
%      Area = I + B / 2 - 1
%
%    where
%
%      I = the number of lattice points contained strictly inside the polygon;
%
%      B = the number of lattice points that lie exactly on the boundary.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Branko Gruenbaum and G C Shephard,
%    Pick's Theorem,
%    The American Mathematical Monthly,
%    Volume 100, 1993, pages 150-161.
%
%  Parameters:
%
%    Input, integer I, the number of interior lattice points.
%
%    Input, integer B, the number of boundary lattice points.
%
%    Output, real AREA, the area of the lattice polygon.
%
  area = i + b / 2.0 - 1.0;

  return
end
