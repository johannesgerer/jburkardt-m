function node_xyz = sphere_icos1_points ( factor, node_num )

%*****************************************************************************80
%
%% SPHERE_ICOS1_POINTS returns icosahedral grid points on a sphere.
%
%  Discussion:
%
%    With FACTOR = 1, the grid has 20 triangular faces and 12 nodes.
%
%    With FACTOR = 2, each triangle of the icosahedron is subdivided into
%    2x2 subtriangles, resulting in 80 faces and 
%    42 = 12 + 20 * 3 * (1)/2 + 20 * 0 ) nodes.
%
%    With FACTOR = 3, each triangle of the icosahedron is subdivided into
%    3x3 subtriangles, resulting in 180 faces and 
%    72 ( = 12 + 20 * 3 * (2)/2 + 20 * 1 ) nodes.
%
%    In general, each triangle is subdivided into FACTOR*FACTOR subtriangles,
%    resulting in 20 * FACTOR * FACTOR faces and
%      12 
%    + 20 * 3          * (FACTOR-1) / 2 
%    + 20 * (FACTOR-2) * (FACTOR-1) / 2 nodes.
%
%
%    There are two possible ways of doing the subdivision:
%
%    If we subdivide the secants, we will be creating congruent faces and
%    sides on the original, non-projected icosahedron, which will result,
%    after projection, in faces and sides on the sphere that are not congruent.
%
%    If we subdivide the spherical angles, then after projection we will 
%    have spherical faces and sides that are congruent.  In general, this
%    is likely to be the more desirable subdivision scheme.
%
%    This routine uses the simpler secant subdivision scheme.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR, the subdivision factor, which must
%    be at least 1.
%
%    Input, integer NODE_NUM, the number of nodes, as reported
%    by SPHERE_IMP_GRID_ICOS_NUM.
%
%    Output, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%  Local Parameters:
%
%    POINT_NUM, EDGE_NUM, FACE_NUM and FACE_ORDER_MAX are counters 
%    associated with the icosahedron, and POINT_COORD, EDGE_POINT, 
%    FACE_ORDER and FACE_POINT are data associated with the icosahedron.
%    We need to refer to this data to generate the grid.
%
%    NODE counts the number of nodes we have generated so far.  At the
%    end of the routine, it should be equal to NODE_NUM.
%

%
%  Size the icosahedron.
%
  [ point_num, edge_num, face_num, face_order_max ] = icos_num ( );
%
%  Set the icosahedron.
%
  [ point_coord, edge_point, face_order, face_point ] = icos_shape ( ...
    point_num, edge_num, face_num, face_order_max );
%
%  Generate the point coordinates.
%
%  A.  Points that are the icosahedral vertices.
%
  node = 0;
  node_xyz(1:3,1:12) = point_coord(1:3,1:12);
%
%  B. Points in the icosahedral edges, at 
%  1/FACTOR, 2/FACTOR, ..., (FACTOR-1)/FACTOR.
%
  node = 12;

  for edge = 1 : edge_num

    a = edge_point(1,edge);
    b = edge_point(2,edge);

    for f = 1 : factor - 1

      node = node + 1;

      node_xyz(1:3,node) = ...
        ( ( factor - f ) * point_coord(1:3,a)   ...
        + (          f ) * point_coord(1:3,b) ) ...
        / ( factor     );

      node_norm = sqrt ( sum ( node_xyz(1:3,node).^2 ) );

      node_xyz(1:3,node) = node_xyz(1:3,node) / node_norm;

    end
  end
%
%  C.  Points in the icosahedral faces.
%
  for face = 1 : face_num

    a = face_point(1,face);
    b = face_point(2,face);
    c = face_point(3,face);

    for f1 = 1 : factor - 1
      for f2 = 1 : factor - f1 - 1

        node = node + 1;

        node_xyz(1:3,node) = ...
          ( ( factor - f1 - f2 ) * point_coord(1:3,a)   ...
          + (          f1      ) * point_coord(1:3,b)   ...
          + (               f2 ) * point_coord(1:3,c) ) ...
          / ( factor           );

        node_norm = sqrt ( sum ( node_xyz(1:3,node).^2 ) );

        node_xyz(1:3,node) = node_xyz(1:3,node) / node_norm;

      end
    end

  end

  return
end
