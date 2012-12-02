function v = voronoi_polygon_vertices ( node, neighbor_num, ...
  neighbor_index, node_num, node_xy )

%*****************************************************************************80
%
%% VORONOI_POLYGON_VERTICES computes the vertices of a Voronoi polygon.
%
%  Discussion:
%
%    This routine is only appropriate for Voronoi polygons that are finite.
%
%    The routine is given the indices of the nodes that are neighbors of a 
%    given "center" node.  A node is a neighbor of the center node if the
%    Voronoi polygons of the two nodes share an edge.  The triangles of the 
%    Delaunay triangulation are formed from successive pairs of these neighbor 
%    nodes along with the center node.
%
%    Given only the neighbor node information, it is possible to determine
%    the location of the vertices of the polygonal Voronoi region by computing
%    the circumcenters of the Delaunay triangles.
%
%    It is assumed that this subroutine is being called by a process which has 
%    computed the Voronoi diagram of a large set of nodes, so the arrays X and 
%    Y are dimensioned by NODE_NUM, which may be much greater than the number 
%    of neighbor nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Atsuyuki Okabe, Barry Boots, Kokichi Sugihara, Sung Nok Chiu,
%    Spatial Tessellations: Concepts and Applications of Voronoi Diagrams,
%    Second Edition,
%    Wiley, 2000.
%
%  Parameters:
%
%    Input, integer NODE, the index of the node whose Voronoi
%    polygon is to be analyzed.  1 <= NODE <= NODE_NUM.
%
%    Input, integer NEIGHBOR_NUM, the number of neighbor nodes of
%    the given node.
%
%    Input, integer NEIGHBOR_INDEX(NEIGHBOR_NUM), the indices
%    of the neighbor nodes.  These indices are used to access the
%    X and Y arrays.  The neighbor nodes should be listed in the
%    (counter-clockwise) order in which they occur as one circles 
%    the center node.
%
%    Input, integer NODE_NUM, the total number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Output, real V(2,NEIGHBOR_NUM), the coordinates of 
%    the vertices of the Voronoi polygon around node NODE.
%
  dim_num = 2;

  if ( node < 1 | node_num < node )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VORONOI_POLYGON_VERTICES - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of input parameter NODE.\n' );
    error ( 'VORONOI_POLYGON_VERTICES - Fatal error!' );
  end

  t(1:dim_num,1) = node_xy(1:dim_num,node);

  ip1 = neighbor_index(1);
  t(1:dim_num,3) = node_xy(1:dim_num,ip1);
 
  for i = 1 : neighbor_num

    t(1:dim_num,2) = t(1:dim_num,3);

    ip1 = i4_wrap ( i+1, 1, neighbor_num );
    ip1 = neighbor_index(ip1);
    t(1:dim_num,3) = node_xy(1:dim_num,ip1);

    v(1:dim_num,i) = triangle_circumcenter_2d ( t );

  end

  return
end
