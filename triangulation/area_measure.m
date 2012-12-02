function [ area_min, area_max, area_ratio, area_ave, area_std ] = ...
  area_measure ( n, z, triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% AREA_MEASURE determines the area ratio quality measure.
%
%  Discusion:
%
%    This measure computes the area of every triangle, and returns
%    the ratio of the minimum to the maximum triangle.  A value of
%    1 is "perfect", indicating that all triangles have the same area.
%    A value of 0 is the worst possible result.
%
%    The code has been modified to 'allow' 6-node triangulations.
%    However, no effort is made to actually process the midside nodes.
%    Only information from the vertices is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(2,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the triangulation.
%
%    Output, real AREA_MIN, AREA_MAX, the minimum and maximum 
%    areas.
%
%    Output, real AREA_RATIO, the ratio of the minimum to the
%    maximum area.
%
%    Output, real AREA_AVE, the average area.
%
%    Output, real AREA_STD, the standard deviation of the areas.
%
  area_max = 0.0;
  area_min = r8_huge ( );
  area_ave = 0.0;

  for triangle = 1 : triangle_num

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                    + x2 * ( y3 - y1 ) ...
                    + x3 * ( y1 - y2 ) );

    area_min = min ( area_min, area );
    area_max = max ( area_max, area );
    area_ave = area_ave + area;

  end

  area_ave = area_ave / triangle_num;

  area_std = 0.0;
  for triangle = 1 : triangle_num

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                     + x2 * ( y3 - y1 ) ...
                     + x3 * ( y1 - y2 ) );

    area_std = area_std + ( area - area_ave ).^2;
  end
  area_std = sqrt ( area_std / triangle_num );

  if ( 0.0 < area_max )
    area_ratio = area_min / area_max;
  else
    area_ratio = 0.0;
  end

  return
end
