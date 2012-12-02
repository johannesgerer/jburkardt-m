function area = voronoi_polygon_area ( node, neighbor_num, ...
  neighbor_index, node_num, node_xy )

%*****************************************************************************80
%
%% VORONOI_POLYGON_AREA computes the area of a Voronoi polygon in 2D.
%
%  Discussion:
%
%    It is assumed that the Voronoi polygon is finite!  Every Voronoi
%    diagram includes some regions which are infinite, and for those,
%    this formula is not appropriate.
%
%    The routine is given the indices of the nodes that are neighbors of a 
%    given "center" node.  A node is a neighbor of the center node if the
%    Voronoi polygons of the two nodes share an edge.  The triangles of the 
%    Delaunay triangulation are formed from successive pairs of these neighbor 
%    nodes along with the center node.
%
%    The assumption that the polygon is a Voronoi polygon is
%    used to determine the location of the boundaries of the polygon,
%    which are the perpendicular bisectors of the lines connecting
%    the center point to each of its neighbors.
%
%    The finiteness assumption is employed in part in the
%    assumption that the polygon is bounded by the finite
%    line segments from point 1 to 2, 2 to 3, ...,
%    M-1 to M, and M to 1, where M is the number of neighbors.
%
%    It is assumed that this subroutine is being called by a
%    process which has computed the Voronoi diagram of a large
%    set of nodes, so the arrays X and Y are dimensioned by
%    NODE_NUM, which may be much greater than the number of neighbor
%    nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2005
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
%    Wiley, 2000, page 485.
%
%  Parameters:
%
%    Input, integer NODE, the index of the node whose Voronoi
%    polygon is to be measured.  1 <= NODE <= NODE_NUM.
%
%    Input, integer NEIGHBOR_NUM, the number of neighbor nodes of
%    the given node.
%
%    Input, integer NEIGHBOR_INDEX(NEIGHBOR_NUM), the indices
%    of the neighbor nodes (used to access X and Y).  The neighbor
%    nodes should be listed in the (counter-clockwise) order in
%    which they occur as one circles the center node.
%
%    Input, integer NODE_NUM, the total number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Output, real AREA, the area of the Voronoi polygon.
%
  dim_num = 2;

  area = 0.0;

  if ( node < 1 | node_num < node )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VORONOI_POLYGON_AREA - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of input parameter NODE.\n' );
    error ( 'VORONOI_POLYGON_AREA - Fatal error!' );
  end

  pc(1:dim_num) = node_xy(1:dim_num,node)';

  i = neighbor_num;

  pi(1:dim_num) = node_xy(1:dim_num,i)';

  j = 1;
  j = neighbor_index(j);

  pj(1:dim_num) = node_xy(1:dim_num,j)';

  a = ( pi(1)^2 + pi(2)^2 - pc(1)^2 - pc(2)^2 );
  b = ( pj(1)^2 + pj(2)^2 - pc(1)^2 - pc(2)^2 );
  c = 2.0 * ( ( pi(1) - pc(1) ) * ( pj(2) - pc(2) ) ...
            - ( pj(1) - pc(1) ) * ( pi(2) - pc(2) ) );
  uj(1) = ( a * ( pj(2) - pc(2) ) - b * ( pi(2) - pc(2) )  ) / c;
  uj(2) = ( a * ( pj(1) - pc(1) ) - b * ( pi(1) - pc(1) )  ) / c;

  for i = 1 : neighbor_num

    pi(1:dim_num) = pj(1:dim_num);
    ui(1:dim_num) = uj(1:dim_num);

    j = i4_wrap ( i+1, 1, neighbor_num );
    j = neighbor_index(j);

    pj(1:dim_num) = node_xy(1:dim_num,j)';

    a = ( pi(1)^2 + pi(2)^2 - pc(1)^2 - pc(2)^2 );
    b = ( pj(1)^2 + pj(2)^2 - pc(1)^2 - pc(2)^2 );
    c = 2.0 * ( ( pi(1) - pc(1) ) * ( pj(2) - pc(2) ) ...
              - ( pj(1) - pc(1) ) * ( pi(2) - pc(2) ) );
    uj(1) = ( a * ( pj(2) - pc(2) ) - b * ( pi(2) - pc(2) )  ) / c;
    uj(2) = ( a * ( pj(1) - pc(1) ) - b * ( pi(1) - pc(1) )  ) / c;

    area = area + uj(1) * ui(2) - ui(1) * uj(2);

  end

  area = 0.5 * area;

  return
end
