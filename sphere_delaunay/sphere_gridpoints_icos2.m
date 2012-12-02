function node_xyz = sphere_gridpoints_icos2 ( factor, node_num )

%*****************************************************************************80
%
%% SPHERE_GRIDPOINTS_ICOS2 returns icosahedral grid points on a sphere.
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
%    92 ( = 12 + 20 * 3 * (2)/2 + 20 * 1 ) nodes.
%
%    In general, each triangle is subdivided into FACTOR*FACTOR subtriangles,
%    resulting in 20 * FACTOR * FACTOR faces and
%      12 
%    + 20 * 3          * (FACTOR-1) / 2 
%    + 20 * (FACTOR-2) * (FACTOR-1) / 2 nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2010
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
%    by SPHERE_IMP_GRID_ICOS_SIZE.
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
  [ point_num, edge_num, face_num, face_order_max ] = icos_size ( );
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
  node_xyz(1:3,1:point_num) = point_coord(1:3,1:point_num);
%
%  B. Points in the icosahedral edges, at 
%  1/FACTOR, 2/FACTOR, ..., (FACTOR-1)/FACTOR.
%
  node = 12;

  for edge = 1 : edge_num

    a = edge_point(1,edge);

    b = edge_point(2,edge);
%
%  Determine the "distance" = angle between points A and B.
%
    theta = sphere_distance_xyz ( point_coord(1:3,a), point_coord(1:3,b) );
%
%  Polarize B into BP + BN and normalize BN.
%
    [ bn, bp ] = r8vec_polarize ( 3, point_coord(1:3,b), point_coord(1:3,a) );

    bn(1:3,1) = bn(1:3,1) / norm ( bn );
%
%  March from A to B, by taking equally spaced angles from 0 to THETA.
%  F = 0      => ANGLE = 0     => A
%  F = FACTOR => ANGLE = THETA => B
%
    for f = 1 : factor - 1

      node = node + 1;

      angle = ( f * theta ) / factor;
     
      node_xyz(1:3,node) = cos ( angle ) * point_coord(1:3,a) ...
                         + sin ( angle ) * bn(1:3,1);

    end
  end
%
%  C.  Points in the icosahedral faces.
%
  for face = 1 : face_num

    a = face_point(1,face);

    b = face_point(2,face);

    c = face_point(3,face);
%
%  Determine the "distance" = angle between points A and B, A and C.
%
    theta_ab = sphere_distance_xyz ( point_coord(1:3,a), point_coord(1:3,b) );

    theta_ac = sphere_distance_xyz ( point_coord(1:3,a), point_coord(1:3,c) );
%
%  Polarize B = BP + BN and normalize BN, C = CP + CN, and normalize CN.
%
    [ bn, bp ] = r8vec_polarize ( 3, point_coord(1:3,b), point_coord(1:3,a) );
    bn(1:3,1) = bn(1:3,1) / norm ( bn );

    [ cn, cp ] = r8vec_polarize ( 3, point_coord(1:3,c), point_coord(1:3,a) );
    cn(1:3,1) = cn(1:3,1) / norm ( cn );
%
%  March AB from A to B:
%    FA = 0      => ANGLE = 0        => AB = A
%    FA = FACTOR => ANGLE = THETA_AB => AB = B
%
%  March AC from A to C:
%    FA = 0      => ANGLE = 0        => AC = A
%    FA = FACTOR => ANGLE = THETA_AC => AC = C
%
    for fa = 2 : factor - 1
%
%  Determine points AB and AC that use cos ( FA / FACTOR ) of A 
%  and cos ( ( FACTOR - FA ) / FACTOR ) of B or C.
%
      angle = ( fa * theta_ab ) / factor;
      ab(1:3,1) = cos ( angle ) * point_coord(1:3,a) + sin ( angle ) * bn(1:3,1);

      angle = ( fa * theta_ac ) / factor;
      ac(1:3,1) = cos ( angle ) * point_coord(1:3,a) + sin ( angle ) * cn(1:3,1);
%
%  Determine the "distance" = angle between points AB and AC.
%
      theta_bc = sphere_distance_xyz ( ab, ac );
%
%  Polarize AC into ACP + ACN and normalize ACN.
%
      [ acn, acp ] = r8vec_polarize ( 3, ac, ab );
      acn(1:3,1) = acn(1:3,1) / norm ( acn );
%
%  The interval between AB and AC is broken into FA intervals.
%  Go from 1 to FA - 1.
%
      for fbc = 1 : fa - 1

        node = node + 1;

        angle = fbc * theta_bc / fa;
     
        node_xyz(1:3,node) = cos ( angle ) * ab(1:3,1) ...
                           + sin ( angle ) * acn(1:3,1);

      end
    end

  end

  return
end
