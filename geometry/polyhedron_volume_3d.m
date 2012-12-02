function volume = polyhedron_volume_3d ( coord, maxorder, face_num, node, ...
  node_num, order )

%*****************************************************************************80
%
%% POLYHEDRON_VOLUME_3D computes the volume of a polyhedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real COORD(3,NODE_NUM), the 3D coordinates of the vertices.
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
%    Output, real VOLUME, the volume of the polyhedron.
%
  dim_num = 3;

  volume = 0.0;
%
%  Triangulate each face.
%
  for face = 1 : face_num

    n3 = node(face,order(face));

    for v = 1 : order(face) - 2

      n1 = node(face,v);
      n2 = node(face,v+1);

      volume = volume ...
        + coord(1,n1) * ( coord(2,n2) * coord(3,n3) - coord(2,n3) * coord(3,n2) ) ...
        + coord(1,n2) * ( coord(2,n3) * coord(3,n1) - coord(2,n1) * coord(3,n3) ) ...
        + coord(1,n3) * ( coord(2,n1) * coord(3,n2) - coord(2,n2) * coord(3,n1) );

    end

  end

  volume = volume / 6.0;

  return
end
