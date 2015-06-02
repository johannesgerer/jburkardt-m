function line = sphere_llq_grid_lines ( nlat, nlong, line_num )

%*****************************************************************************80
%
%% SPHERE_LLQ_GRID_LINES returns lines for an LLQ grid on a sphere.
%
%  Discussion:
%
%    A SPHERE LLQ grid imposes a grid of quadrilaterals on a sphere,
%    using latitude and longitude lines.
%
%    The point numbering system is the same used in SPHERE_LLQ_GRID_POINTS,
%    and that routine may be used to compute the coordinates of the points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NLAT, NLONG, the number of latitude and longitude
%    lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so NLAT = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Input, integer LINE_NUM, the number of grid lines.
%
%    Output, integer LINE(LINE_NUM,2), contains pairs of point indices for
%    line segments that make up the grid.
%
  l = 0;
  line = zeros ( line_num, 2 );
%
%  "Vertical" lines.
%
  for j = 0 : nlong - 1

    old = 1;
    new = j + 2;
    l = l + 1;
    line(l,1:2) = [ old, new ];

    for i = 1 : nlat - 1

      old = new;
      new = old + nlong;
      l = l + 1;
      line(l,1:2) = [ old, new ];

    end

    old = new;
    l = l + 1;
    line(l,1:2) = [ old, 1 + nlat * nlong + 1 ];

  end
%
%  "Horizontal" lines.
%
  for i = 1 : nlat

    new = 1 + ( i - 1 ) * nlong + 1;

    for j = 0 : nlong - 2
      old = new;
      new = old + 1;
      l = l + 1;
      line(l,1:2) = [ old, new ];
    end

    old = new;
    new = 1 + ( i - 1 ) * nlong + 1;
    l = l + 1;
    line(l,1:2) = [ old, new ];

  end

  return
end

