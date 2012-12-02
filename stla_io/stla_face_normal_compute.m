function face_normal = stla_face_normal_compute ( node_num, face_num, ...
  node_xyz, face_node )

%*****************************************************************************80
%
%% STLA_FACE_NORMAL_COMPUTE computes normal vectors for an ASCII StereoLithography file.
%
%  Discussion:
%
%    This routine computes the normal vector to each triangular face
%    in the STLA solid.  If the nodes of each triangular face are
%    listed in counterclockwise order (as seen from outside the solid),
%    then the normal vectors will be properly outward facing.
%
%    The normal vectors will have unit Euclidean norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer FACE_NODE(3,FACE_NUM), the nodes making faces.
%
%    Input, integer FACE_MAX, the maximum number of faces.
%
%    Output, real FACE_NORMAL(3,FACE_NUM), the normal vector at each face.
%
  for face = 1 : face_num

    n1 = face_node(1,face);
    n2 = face_node(2,face);
    n3 = face_node(3,face);

    v1(1:3) = node_xyz(1:3,n2) - node_xyz(1:3,n1);
    v2(1:3) = node_xyz(1:3,n3) - node_xyz(1:3,n1);

    face_normal(1:3,face) = r8vec_cross_3d ( v1, v2 );

    norm = sqrt ( sum ( ( face_normal(1:3,face) ).^2 ) );

    if ( norm ~= 0.0 )
      face_normal(1:3,face) = face_normal(1:3,face) / norm;
    end

  end

  return
end
