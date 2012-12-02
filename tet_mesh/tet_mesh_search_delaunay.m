function [ tet_index, face, step_num ] = tet_mesh_search_delaunay ( ...
  node_num, node_xyz, tet_order, tet_num, tet_node, tet_neighbor, p )

%*****************************************************************************80
%
%% TET_MESH_SEARCH_DELAUNAY searches a Delaunay tet mesh for a point.
%
%  Discussion:
%
%    The algorithm "walks" from one tetrahedron to its neighboring tetrahedron,
%    and so on, until a tetrahedron is found containing point P, or P is found
%    to be outside the convex hull.
%
%    The algorithm computes the barycentric coordinates of the point with
%    respect to the current tetrahedron.  If all 4 quantities are positive,
%    the point is contained in the tetrahedron.  If the I-th coordinate is
%    negative, then P lies on the far side of edge I, which is opposite
%    from vertex I.  This gives a hint as to where to search next.
%
%    For a Delaunay tet mesh, the search is guaranteed to terminate.
%    For other meshes, a cycle may occur.
%
%    Note the surprising fact that, even for a Delaunay tet mesh of
%    a set of nodes, the nearest node to P need not be one of the
%    vertices of the tetrahedron containing P.
%
%    The code can be called for tet meshes of any order, but only
%    the first 4 nodes in each tetrahedron are considered.  Thus, if
%    higher order tetrahedrons are used, and the extra nodes are intended
%    to give the tetrahedron a polygonal shape, these will have no effect,
%    and the results obtained here might be misleading.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2009
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of
%    the nodes.
%
%    Input, integer TET_ORDER, the order of the tetrahedrons.
%
%    Input, intege TET_NUM, the number of tetrahedrons.
%
%    Input, integer TET_NODE(TET_ORDER,TET_NUM),
%    the nodes that make up each tetrahedron.
%
%    Input, integer TET_NEIGHBOR(4,TET_NUM), the
%    tetrahedron neighbor list.
%
%    Input, real P(3), the coordinates of a point.
%
%    Output, integer TET_INDEX, the index of the tetrahedron
%    where the search ended.  If a cycle occurred, then TET_INDEX = -1.
%
%    Output, integer FACE, indicates the position of the point P in
%    face TET_INDEX:
%    0, the interior or boundary of the tetrahedron;
%    -1, outside the convex hull of the tet mesh, past face 1;
%    -2, outside the convex hull of the tet mesh, past face 2;
%    -3, outside the convex hull of the tet mesh, past face 3.
%    -4, outside the convex hull of the tet mesh, past face 4.
%
%    Output, integer STEP_NUM, the number of steps taken.
%
  persistent tet_index_save;

  if ( length ( tet_index_save ) == 0 )
    tet_index_save = -1;
  end
%
%  If possible, start with the previous successful value of TET_INDEX.
%
  if ( tet_index_save < 1 | tet_num < tet_index_save )
    tet_index = floor ( ( tet_num + 1 ) / 2 );
  else
    tet_index = tet_index_save;
  end

  step_num = -1;
  face = 0;

  while ( 1 )

    step_num = step_num + 1;

    if ( tet_num < step_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TET_MESH_SEARCH_DELAUNAY - Fatal error!\n' );
      fprintf ( 1, '  The algorithm seems to be cycling.\n' );
      tet_index = -1;
      face = -1;
      error ( 'TET_MESH_SEARCH_DELAUNAY - Fatal error!' );
    end

    alpha = tetrahedron_barycentric ( node_xyz(1:3,tet_node(1:4,tet_index)), p );
%
%  If the barycentric coordinates are all positive, then the point
%  is inside the tetrahedron and we're done.
%
    if ( 0.0 <= alpha(1) & 0.0 <= alpha(2) & 0.0 <= alpha(3) & 0.0 <= alpha(4) )
      break
    end
%
%  At least one barycentric coordinate is negative.
%
%  If there is a negative barycentric coordinate for which there exists an
%  opposing tetrahedron neighbor closer to the point, move to that tetrahedron.
%
    if ( alpha(1) < 0.0 & 0 < tet_neighbor(1,tet_index) )
      tet_index = tet_neighbor(1,tet_index);
      continue
    elseif ( alpha(2) < 0.0 & 0 < tet_neighbor(2,tet_index) )
      tet_index = tet_neighbor(2,tet_index);
      continue
    elseif ( alpha(3) < 0.0 & 0 < tet_neighbor(3,tet_index) )
      tet_index = tet_neighbor(3,tet_index);
      continue
    elseif ( alpha(4) < 0.0 & 0 < tet_neighbor(4,tet_index) )
      tet_index = tet_neighbor(4,tet_index);
      continue
    end
%
%  All negative barycentric coordinates correspond to vertices opposite
%  faces on the convex hull.
%
%  Note the face and exit.
%
    if ( alpha(1) < 0.0 )
      face = -1;
      break
    elseif ( alpha(2) < 0.0 )
      face = -2;
      break
    elseif ( alpha(3) < 0.0 )
      face = -3;
      break
    elseif ( alpha(4) < 0.0 )
      face = -4;
      break
    end

  end

  tet_index_save = tet_index;

  return
end
