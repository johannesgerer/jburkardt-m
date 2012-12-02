function [ triangle_index, alpha, beta, gamma, edge, step_num ] = ...
  triangulation_search_delaunay ( node_num, node_xy, triangle_order, ...
  triangle_num, triangle_node, triangle_neighbor, p )

%*****************************************************************************80
%
%% TRIANGULATION_SEARCH_DELAUNAY searches a Delaunay triangulation for a point.
%
%  Purpose:
%
%    The algorithm "walks" from one triangle to its neighboring triangle,
%    and so on, until a triangle is found containing point P, or P is found 
%    to be outside the convex hull. 
%
%    The algorithm computes the barycentric coordinates of the point with 
%    respect to the current triangle.  If all three quantities are positive,
%    the point is contained in the triangle.  If the I-th coordinate is
%    negative, then P lies on the far side of edge I, which is opposite
%    from vertex I.  This gives a hint as to where to search next.
%
%    For a Delaunay triangulation, the search is guaranteed to terminate.
%    For other triangulations, a cycle may occur.
%
%    Note the surprising fact that, even for a Delaunay triangulation of
%    a set of points, the nearest point to P need not be one of the
%    vertices of the triangle containing P.  
%
%    The code can be called for triangulations of any order, but only
%    the first three nodes in each triangle are considered.  Thus, if
%    higher order triangles are used, and the extra nodes are intended
%    to give the triangle a polygonal shape, these will have no effect,
%    and the results obtained here might be misleading.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2012
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
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
%    Input, real NODE_XY(2,NODE_NUM), the vertices.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), 
%    the nodes that make up each triangle.
%
%    Input, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle 
%    neighbor list.
%
%    Input, real P(2), the coordinates of a point.
%
%    Output, integer TRIANGLE_INDEX, the index of the triangle where the 
%    search ended.  If a cycle occurred, then TRIANGLE_INDEX = -1.
%
%    Output, real ALPHA, BETA, GAMMA, the barycentric
%    coordinates of the point relative to triangle TRIANGLE_INDEX.
%
%    Output, integer EDGE, indicates the position of the point P in
%    triangle TRIANGLE_INDEX:
%    0, the interior or boundary of the triangle;
%    -1, outside the convex hull of the triangulation, past edge 1;
%    -2, outside the convex hull of the triangulation, past edge 2;
%    -3, outside the convex hull of the triangulation, past edge 3.
%
%    Output, integer STEP_NUM, the number of steps.
%
  persistent triangle_index_save;

  dim_num = 2;

  step_num = - 1;
  edge = 0;

  if ( length ( triangle_index_save ) == 0 )
    triangle_index_save = -1;
  end

  if ( triangle_index_save < 1 | triangle_num < triangle_index_save )
    triangle_index = floor ( ( triangle_num + 1 ) / 2 );
  else
    triangle_index = triangle_index_save;
  end

  while ( 1 )

    step_num = step_num + 1;

    if ( triangle_num < step_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGULATION_SEARCH_DELAUNAY - Fatal error!\n' );
      fprintf ( 1, '  The algorithm seems to be cycling.\n' );
      triangle_index = -1;
      alpha = -1.0;
      beta = -1.0;
      gamma = -1.0;
      edge = -1;
      return
    end
%
%  Get the vertices of triangle TRIANGLE_INDEX.
%
    a = triangle_node(1,triangle_index);
    b = triangle_node(2,triangle_index);
    c = triangle_node(3,triangle_index);
%
%  Using vertex C as a base, compute the distances to vertices A and B,
%  and the point P.
%
    dxa = node_xy(1,a) - node_xy(1,c);
    dya = node_xy(2,a) - node_xy(2,c);

    dxb = node_xy(1,b) - node_xy(1,c);
    dyb = node_xy(2,b) - node_xy(2,c);

    dxp = p(1)         - node_xy(1,c);
    dyp = p(2)         - node_xy(2,c);

    det = dxa * dyb - dya * dxb;
%
%  Compute the barycentric coordinates of the point P with respect
%  to this triangle.
%
    alpha = ( dxp * dyb - dyp * dxb ) / det;
    beta =  ( dxa * dyp - dya * dxp ) / det;
    gamma = 1.0 - alpha - beta;
%
%  If the barycentric coordinates are all positive, then the point
%  is inside the triangle and we're done.
%
    if ( 0.0 <= alpha && 0.0 <= beta && 0.0 <= gamma )
      break
    end
%
%  At least one barycentric coordinate is negative.
%
%  If there is a negative barycentric coordinate for which there exists
%  an opposing triangle neighbor closer to the point, move to that triangle.
%
%  (Two coordinates could be negative, in which case we could go for the
%  most negative one, or the most negative one normalized by the actual
%  distance it represents).
%
    if ( alpha < 0.0 && 0 < triangle_neighbor(2,triangle_index) )
      triangle_index = triangle_neighbor(2,triangle_index);
      continue;
    elseif ( beta < 0.0 && 0 < triangle_neighbor(3,triangle_index) )
      triangle_index = triangle_neighbor(3,triangle_index);
      continue;
    elseif ( gamma < 0.0 && 0 < triangle_neighbor(1,triangle_index) )
      triangle_index = triangle_neighbor(1,triangle_index);
      continue;
    end
%
%  All negative barycentric coordinates correspond to vertices opposite
%  sides on the convex hull.
%
%  Note the edge and exit.
%
    if ( alpha < 0.0 )
      edge = -2;
      break
    elseif ( beta < 0.0 )
      edge = -3;
      break
    elseif ( gamma < 0.0 )
      edge = -1;
      break
    end

  end

  triangle_index_save = triangle_index;

  return
end
