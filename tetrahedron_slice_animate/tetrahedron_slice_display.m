function tetrahedron_slice_display ( pp, normal, t )

%*****************************************************************************80
%
%% TETRAHEDRON_SLICE_DISPLAY displays a "slice" of a tetrahedron.
%
%  Discussion:
%
%    The intersection of a plane and a tetrahedron is one of:
%    0) empty
%    1) a single point
%    2) a single line segment
%    3) a triangle
%    4) a quadrilateral.
%
%    In each case, the region of intersection can be described by the
%    corresponding number of points.  In particular, cases 2, 3 and 4
%    are described by the vertices that bound the line segment, triangle,
%    or quadrilateral.
%
%    The normal form of a plane is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The form of a tetrahedron is
%
%      T(1:3,1:4) contains the coordinates of the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PP(3), a point on the plane.
%
%    Input, real NORMAL(3), a normal vector to the plane.
%
%    Input, real T(3,4), the tetrahedron vertices.
%

%
%  Determine the intersections.
%
  [ int_num, pint ] = plane_normal_tetrahedron_intersect ( pp, normal, t );
%
%  Determine a box that will contain the tetrahedron.
%
  tmin = min ( t, [], 2 );
  tmax = max ( t, [], 2 );
%
%  Declare the 3D axes.
%
  clf

  axis ( [ tmin(1) tmax(1) tmin(2) tmax(2) tmin(3) tmax(3) ] )

  plot3 ( t(1,1:4), t(2,1:4), t(3,1:4), 'b.', 'MarkerSize', 20 );
%
%  Wireframe drawing of the tetrahedron.
%
  line ( [ t(1,1), t(1,2) ], [ t(2,1), t(2,2) ], [ t(3,1), t(3,2) ], ...
    'LineWidth', 2 );
  line ( [ t(1,1), t(1,3) ], [ t(2,1), t(2,3) ], [ t(3,1), t(3,3) ], ...
    'LineWidth', 2 );
  line ( [ t(1,1), t(1,4) ], [ t(2,1), t(2,4) ], [ t(3,1), t(3,4) ], ...
    'LineWidth', 2 );
  line ( [ t(1,2), t(1,3) ], [ t(2,2), t(2,3) ], [ t(3,2), t(3,3) ], ...
    'LineWidth', 2 );
  line ( [ t(1,2), t(1,4) ], [ t(2,2), t(2,4) ], [ t(3,2), t(3,4) ], ...
    'LineWidth', 2 );
  line ( [ t(1,3), t(1,4) ], [ t(2,3), t(2,4) ], [ t(3,3), t(3,4) ], ...
    'LineWidth', 2 );
%
%  Add points of intersection.
%  If 4, points need to be oriented, but let's do that later.
%
  if ( 0 < int_num )
    hold on
    plot3 ( pint(1,1:int_num), pint(2,1:int_num), pint(3,1:int_num), 'k.', ...
      'MarkerSize', 20 );
    color = [1,0,0];
    patch ( pint(1,1:int_num), pint(2,1:int_num), pint(3,1:int_num), color );
  end

  axis equal
  xlabel ( '-X axis-' );
  ylabel ( '-Y axis-' );
  zlabel ( '-Z axis-' );
  title_string = sprintf ( '%d intersection points', int_num );
  title ( title_string );

  hold off

  return
end
