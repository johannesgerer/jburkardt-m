function centroid = polyhedron_centroid_3d ( coord, maxorder, face_num, node, ...
  node_num, order )

%*****************************************************************************80
%
%% POLYHEDRON_CENTROID_3D computes the centroid of a polyhedron in 3D.
%
%  Discussion:
%
%    The centroid can be computed as the volume-weighted average of
%    the centroids of the tetrahedra defined by choosing a point in
%    the interior of the polyhedron, and using as a base every triangle
%    created by triangulating the faces of the polyhedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real COORD(3,NODE_NUM), the vertices.
%    The vertices may be listed in any order.
%
%    Input, integer MAXORDER, the maximum number of vertices that make
%    up a face of the polyhedron.
%
%    Input, integer FACE_NUM, the number of faces of the polyhedron.
%
%    Input, integer NODE(FACE_NUM,MAXORDER).  Face I is defined by
%    the vertices NODE(I,1) through NODE(I,ORDER(I)).  These vertices
%    are listed in neighboring order.
%
%    Input, integer NODE_NUM, the number of points stored in COORD.
%
%    Input, integer ORDER(FACE_NUM), the number of vertices making up
%    each face.
%
%    Output, real CENTROID(3), the centroid of the polyhedron.
%
  dim_num = 3;
%
%  Compute a point in the interior.
%  We take the area-weighted centroid of each face.
%
  point(1:dim_num) = 0.0;
  area = 0.0;

  for face = 1 : face_num

    vert_num = order(face);

    v(1:dim_num,1:vert_num) = coord(1:dim_num,node(face,1:vert_num));

    [ polygon_area, normal ] = polygon_area_3d ( vert_num, v );

    polygon_centroid(1:dim_num) = polygon_centroid_3d ( vert_num, v );

    point(1:dim_num) = point(1:dim_num) + polygon_area * polygon_centroid(1:dim_num);

    area = area + polygon_area;

  end

  point(1:dim_num) = point(1:dim_num) / area;
%
%  Now triangulate each face.
%  For each triangle, consider the tetrahedron created by including POINT.
%
  centroid(1:dim_num) = 0.0;
  volume = 0.0;

  for face = 1 : face_num

    n3 = node(face,order(face));

    for vert = 1 : order(face) - 2

      n1 = node(face,vert);
      n2 = node(face,vert+1);

      tetra(1:dim_num,1:4) = [ ...
        coord(1:dim_num,n1)'; coord(1:dim_num,n2)'; coord(1:dim_num,n3)'; point(1:dim_num) ]';

      tetra_volume = tetrahedron_volume_3d ( tetra );

      tetra_centroid(1:dim_num) = tetrahedron_centroid_3d ( tetra );

      centroid(1:dim_num) = centroid(1:dim_num) + tetra_volume * tetra_centroid(1:dim_num);

      volume = volume + tetra_volume;

    end
  end

  centroid(1:dim_num) = centroid(1:dim_num) / volume;

  return
end
