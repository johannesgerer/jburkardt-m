function [ angle_min, angle_min_triangle, angle_max, angle_max_triangle, ...
  value ] = triangulation_delaunay_discrepancy_compute ( node_num, node_xy, ...
  triangle_order, triangle_num, triangle_node, triangle_neighbor )

%*****************************************************************************80
%
%% TRIANGULATION_DELAUNAY_DISCREPANCY_COMPUTE reports if a triangulation is Delaunay.
%
%  Discussion:
%
%    A (maximal) triangulation is Delaunay if and only if it is locally
%    Delaunay.
%
%    A triangulation is Delaunay if the minimum angle over all triangles
%    in the triangulation is maximized.  That is, there is no other
%    triangulation of the points which has a larger minimum angle.
%
%    A triangulation is locally Delaunay if, for every pair of triangles
%    that share an edge, the minimum angle in the two triangles is larger
%    than the minimum angle in the two triangles formed by removing the
%    common edge and joining the two opposing vertices.
%
%    This function examines the question of whether a given triangulation
%    is locally Delaunay.  It does this by looking at every pair of
%    neighboring triangles and comparing the minimum angle attained
%    for the current triangle pair and the alternative triangle pair.
%
%    Let A(i,j) be the minimum angle formed by triangles T(i) and T(j),
%    which are two triangles in the triangulation which share a common edge.
%    Let B(I,J) be the minimum angle formed by triangles S(i) and S(j),
%    where S(i) and S(j) are formed by removing the common edge of T(i)
%    and T(j), and joining the opposing vertices.
%
%    Then the triangulation is Delaunay if B(i,j) <= A(i,j) for every
%    pair of neighbors T(i) and T(j).
%
%    If A(i,j) < B(i,j) for at least one pair of neighbors, the triangulation
%    is not a Delaunay triangulation.
%
%    This program returns VALUE = min ( A(i,j) - B(i,j) ) over all
%    triangle neighbors.  VALUE is scaled to be in degrees, for
%    comprehensibility.  If VALUE is negative, then at least one pair
%    of triangles violates the Delaunay condition, and so the entire
%    triangulation is not a Delaunay triangulation.  If VALUE is nonnegative,
%    then the triangulation is a Delaunay triangulation.
%
%    It is useful to return VALUE, rather than a simple True/False value,
%    because there can be cases where the Delaunay condition is only
%    "slightly" violated.  A simple example is a triangulation formed
%    by starting with a mesh of squares and dividing each square into
%    two triangles by choosing one of the diagonals of the square.
%    The Delaunay discrepancy for this mesh, if computed exactly, is 0,
%    but roundoff could easily result in discrepancies that were very
%    slightly negative.
%
%    If VALUE is positive, and not very small in magnitude, then every
%    pair of triangles in the triangulation satisfies the local Delaunay
%    condition, and so the triangulation is a Delaunay triangulation.
%
%    If VALUE is negative, and not very small in magnitude, then at least
%    one pair of triangles violates the Delaunay condition, and to a
%    significant degree.  The triangulation is not a Delaunay triangulation.
%
%    If the magnitude of VALUE is very close to zero, then the triangulation
%    is numerically ambiguous.  At least one pair of triangles violates
%    or almost violates the condition, but no triangle violates the
%    condition to a great extent.  The user must judge whether the
%    violation is significant or not.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2009
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer ( kind = 4 ) NODE_NUM, the number of nodes.
%
%    Input, real ( kind = 8 ) NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ( kind = 4 ) TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the nodes that make up each triangle.
%
%    Input, integer ( kind = 4 ) TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the
%    triangle neighbor list.
%
%    Output, real ( kind = 8 ) ANGLE_MIN, the minimum angle that occurred in
%    the triangulation.
%
%    Output, integer ( kind = 4 ) ANGLE_MIN_TRIANGLE, the triangle in which
%    the minimum angle occurred.
%
%    Output, real ( kind = 8 ) ANGLE_MAX, the maximum angle that occurred in
%    the triangulation.
%
%    Output, integer ( kind = 4 ) ANGLE_MAX_TRIANGLE, the triangle in which
%    the maximum angle occurred.
%
%    Output, real ( kind = 8 ) VALUE, the minimum value of ( A(i,j) - B(i,j) ).
%    POSITIVE indicates the triangulation is Delaunay.
%    VERY NEAR ZERO is a numerically ambiguous case.
%    NEGATIVE indicates the triangulation is not Delaunay.
%
  angle_max = 0.0;
  angle_max_triangle = - 1;
  angle_min = pi;
  angle_min_triangle = -1;
  value = 0.0;
%
%  Consider triangle TRIANGLE1
%
  for triangle1 = 1 : triangle_num
%
%  Consider the side opposite vertex NEIGHBOR.
%
    for neighbor = 1 : 3

      triangle2 = triangle_neighbor(neighbor,triangle1);
%
%  There might be no neighbor on side NEIGHBOR.
%
      if ( triangle2 < 0 )
        continue
      end
%
%  We only need to check a pair of triangles once.
%
      if ( triangle2 < triangle1 )
        continue
      end
%
%  List the vertices of the quadrilateral in such a way
%  that the nodes of triangle 1 come first.
%
%  We rely on a property of the TRIANGLE_NEIGHBOR array, namely, that
%  neighbor #1 is on the side opposite to vertex #1, and so on.
%
      i1 = i4_wrap ( neighbor + 2, 1, 3 );
      i2 = i4_wrap ( neighbor,     1, 3 );
      i3 = i4_wrap ( neighbor + 1, 1, 3 );

      n1 = triangle_node(i1,triangle1);
      n2 = triangle_node(i2,triangle1);
      n3 = triangle_node(i3,triangle1);
%
%  The "odd" or "opposing" node of the neighboring triangle
%  is the one which follows common node I3.
%
      n4 = -1;
      for i = 1 : 3
        if ( triangle_node(i,triangle2) == n3 )
          i4 = i + 1;
          i4 = i4_wrap ( i4, 1, 3 );
          n4 = triangle_node(i4,triangle2);
          break
        end
      end

      if ( n4 == -1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGULATION_DELAUNAY_DISCREPANCY_COMPUTE - Fatal error!\n' );
        fprintf ( 1, '  Could not identify the fourth node.\n' );
        fprintf ( 1, ' '
        fprintf ( 1, '  Triangle1 = %d\n', triangle1 );
        fprintf ( 1, '  Nodes =     %d  %d  %d\n', triangle_node(1:3,triangle1) );
        fprintf ( 1, '  Neighbors = %d  %d  %d', triangle_neighbor(1:3,triangle1) );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Neighbor index = %d\n', neighbor );
        fprintf ( 1, '\n' );
        fprintf ( 1, '  Triangle2 = %d\n', triangle2 );
        fprintf ( 1, '  Nodes =     %d  %d  %d', triangle_node(1:3,triangle2) );
        fprintf ( 1, '  Neighbors = %d  %d  %d', triangle_neighbor(1:3,triangle2) );
        error ( 'TRIANGULATION_DELAUNAY_DISCREPANCY_COMPUTE - Fatal error!' );
      end
%
%  Compute the minimum angle for (I1,I2,I3) and (I1,I3,I4).
%
      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n2);
      t(1:2,3) = node_xy(1:2,n3);
      angles1 = triangle_angles_2d ( t );

      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n3);
      t(1:2,3) = node_xy(1:2,n4);
      angles2 = triangle_angles_2d ( t );

      angle_min1 = min ( min ( angles1 ), min ( angles2 ) );

      if ( angle_max < max ( angles1 ) )
        angle_max = max ( angles1 );
        angle_max_triangle = triangle1;
      end

      if ( angle_max < max ( angles2 ) )
        angle_max = max ( angles2 );
        angle_max_triangle = triangle2;
      end

      if ( min ( angles1 ) < angle_min )
        angle_min = min ( angles1 );
        angle_min_triangle = triangle1;
      end

      if ( min ( angles2 ) < angle_min )
        angle_min = min ( angles2 );
        angle_min_triangle = triangle2;
      end
%
%  Compute the minimum angle for (I1,I2,I4) and (I2,I3,I4).
%
      t(1:2,1) = node_xy(1:2,n1);
      t(1:2,2) = node_xy(1:2,n2);
      t(1:2,3) = node_xy(1:2,n4);
      angles1 = triangle_angles_2d ( t );

      t(1:2,1) = node_xy(1:2,n2);
      t(1:2,2) = node_xy(1:2,n3);
      t(1:2,3) = node_xy(1:2,n4);
      angles2 = triangle_angles_2d ( t );

      angle_min2 = min ( min ( angles1 ), min ( angles2 ) );
%
%  Compare this value to the current minimum.
%
      value = min ( value, angle_min1 - angle_min2 );

    end

  end
%
%  Scale the results to degrees.
%
  value = value * 180.0 / pi;
  angle_max = angle_max * 180.0 / pi;
  angle_min = angle_min * 180.0 / pi;

  return
end
