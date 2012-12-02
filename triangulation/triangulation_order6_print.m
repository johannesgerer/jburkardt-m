function triangulation_order6_print ( node_num, triangle_num, node_xy, ...
  triangle_node, triangle_neighbor )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_PRINT prints out information defining a Delaunay triangulation.
%
%  Discussion:
%
%    Triangulations created by R8TRIS2 include extra information encoded
%    in the negative values of TRIANGLE_NEIGHBOR.
%
%    Because some of the nodes counted in NODE_NUM may not actually be
%    used in the triangulation, I needed to compute the true number
%    of vertices.  I added this calculation on 13 October 2001.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, real NODE_XY(2,NODE_NUM), the point coordinates.
%
%    Input, integer TRIANGLE_NODE(6,TRIANGLE_NUM), the nodes that make up the triangles.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle neighbors on each side.
%    If there is no triangle neighbor on a particular side, the value of
%    TRIANGLE_NEIGHBOR should be negative.  If the triangulation data was created by
%    R8TRIS2, then there is more information encoded in the negative values.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_ORDER6_PRINT\n' );
  fprintf ( 1, '  Information defining a triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes is %d\n', node_num );

  r8mat_transpose_print ( dim_num, node_num, node_xy, '  Nodes:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of triangles is %d\n', triangle_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sets of six points are used as vertices of\n' );
  fprintf ( 1, '  the triangles.  For each triangle, the vertices\n' );
  fprintf ( 1, '  are listed in counterclockwise order, followed by\n' );
  fprintf ( 1, '  the midside nodes.\n' );

  i4mat_transpose_print ( 6, triangle_num, triangle_node, '  Triangle nodes:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  On each side of a given triangle, there is either\n' );
  fprintf ( 1, '  another triangle, or a piece of the convex hull.\n' );
  fprintf ( 1, '  For each triangle, we list the indices of the three\n' );
  fprintf ( 1, '  neighbors, or (if negative) the codes of the\n' );
  fprintf ( 1, '  segments of the convex hull.\n' );

  i4mat_transpose_print ( 3, triangle_num, triangle_neighbor, ...
    '  Triangle neighbors' );
%
%  Determine the number of vertices.  This is not the same as the
%  number of points!
%
  vertex_list(               1:  triangle_num) = ...
    triangle_node(1,1:triangle_num);
  vertex_list(  triangle_num+1:2*triangle_num) = ...
    triangle_node(2,1:triangle_num);
  vertex_list(2*triangle_num+1:3*triangle_num) = ...
    triangle_node(3,1:triangle_num);

  vertex_list = i4vec_sort_heap_a ( 3*triangle_num, vertex_list );

  [ vertex_num, vertex_list ] = i4vec_sorted_unique ( 3*triangle_num, ...
    vertex_list );
%
%  Determine the number of boundary points.
%
  boundary_num = 2 * vertex_num - triangle_num - 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of boundary points is %d\n', boundary_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The segments that make up the convex hull can be\n' );
  fprintf ( 1, '  determined from the negative entries of the triangle\n' );
  fprintf ( 1, '  neighbor list.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     #   Tri  Side    N1    N2    N3\n' );
  fprintf ( 1, '\n' );

  skip = 0;

  k = 0;

  for i = 1 : triangle_num

    for j = 1 : 3

      if ( triangle_neighbor(j,i) < 0 )
          
        s = -triangle_neighbor(j,i);
        t = floor ( s / 3 );

        if ( t < 1 | triangle_num < t )
          fprintf ( 1, '\n' );
          fprintf ( 1, '  Sorry, this data does not use the R8TRIS2\n' );
          fprintf ( 1, '  convention for convex hull segments.\n' );
          skip = 1;
          break
        end

        s = mod ( s, 3 ) + 1;
        k = k + 1;
        n1 = triangle_node(s,t);
        n2 = triangle_node(s+3,t);
        n3 = triangle_node(i4_wrap(s+1,1,3),t);
        fprintf ( 1, '  %4d  %4d  %4d  %4d  %4d  %4d\n', k, t, s, n1, n2, n3 );
      end

    end

    if ( skip )
      break
    end

  end

  return
end
